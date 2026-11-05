/* Local, dependency-free controls for explicitly marked generated tables. */
(function () {
  "use strict";

  function statusClass(value) {
    value = value.toLowerCase();
    if (["done", "completed", "complete", "no-change", "decided"].includes(value)) return "done";
    if (["active", "in-progress", "running", "harvested"].includes(value)) return "active";
    if (["planned", "partial", "open"].includes(value)) return "planned";
    if (["blocked", "failed", "error", "unreadable"].includes(value)) return "blocked";
    return "neutral";
  }

  function enhance(wrapper, index) {
    var table = wrapper.querySelector("table");
    if (!table || !table.tHead || wrapper.dataset.pipEnhanced) return;
    wrapper.dataset.pipEnhanced = "true";
    var headers = Array.from(table.tHead.rows[0].cells).map(function (cell) {
      return cell.textContent.trim().toLowerCase();
    });
    var rows = Array.from(table.tBodies).flatMap(function (body) {
      return Array.from(body.rows);
    }).map(function (row) {
      return {element: row, cells: Array.from(row.cells).map(function (cell) {
        return cell.textContent.trim();
      }), search: row.textContent.toLowerCase()};
    });
    var controls = document.createElement("form");
    controls.className = "pip-table-controls";
    controls.setAttribute("aria-label", "Filters for table " + (index + 1));
    controls.addEventListener("submit", function (event) { event.preventDefault(); });
    var searchLabel = document.createElement("label");
    searchLabel.textContent = "Search all columns ";
    var search = document.createElement("input");
    search.type = "search";
    search.placeholder = "All search words";
    searchLabel.appendChild(search);
    controls.appendChild(searchLabel);
    var filters = [];
    headers.forEach(function (header, column) {
      if (!["milestone", "package", "packages", "project", "status", "owner", "kind"].includes(header)) return;
      var multiple = header === "packages" || header === "package";
      function values(text) {
        return multiple ? text.split(";").map(function (x) { return x.trim(); }) : [text];
      }
      var options = Array.from(new Set(rows.flatMap(function (row) {
        return values(row.cells[column] || "UNKNOWN");
      }))).filter(Boolean).sort(function (a, b) { return a.localeCompare(b); });
      var label = document.createElement("label");
      label.textContent = header.charAt(0).toUpperCase() + header.slice(1) + " ";
      var select = document.createElement("select");
      select.dataset.pipFilter = header;
      var all = document.createElement("option");
      all.value = "";
      all.textContent = "All";
      select.appendChild(all);
      options.forEach(function (value) {
        var option = document.createElement("option");
        option.value = value;
        option.textContent = value;
        select.appendChild(option);
      });
      label.appendChild(select);
      controls.appendChild(label);
      filters.push({element: select, column: column, values: values});
      if (header === "status") rows.forEach(function (row) {
        var cell = row.element.cells[column], badge = document.createElement("span");
        badge.className = "pip-status pip-status--" + statusClass(cell.textContent.trim());
        badge.textContent = cell.textContent.trim();
        cell.replaceChildren(badge);
      });
    });
    var reset = document.createElement("button");
    reset.type = "reset";
    reset.textContent = "Reset filters";
    controls.appendChild(reset);
    var count = document.createElement("output");
    count.setAttribute("aria-live", "polite");
    controls.appendChild(count);
    var empty = document.createElement("p");
    empty.className = "pip-table-empty";
    empty.textContent = "No rows match. Change the filters or reset them.";
    empty.hidden = true;
    wrapper.insertBefore(controls, wrapper.firstChild);
    wrapper.appendChild(empty);
    function apply() {
      var terms = search.value.trim().toLowerCase().split(/\s+/).filter(Boolean);
      var visible = 0;
      rows.forEach(function (row) {
        var matches = terms.every(function (term) { return row.search.includes(term); }) &&
          filters.every(function (filter) {
            return !filter.element.value || filter.values(row.cells[filter.column] || "UNKNOWN").includes(filter.element.value);
          });
        row.element.hidden = !matches;
        if (matches) visible += 1;
      });
      count.textContent = visible + " of " + rows.length + " rows";
      empty.hidden = visible !== 0;
    }
    search.addEventListener("input", apply);
    filters.forEach(function (filter) { filter.element.addEventListener("change", apply); });
    controls.addEventListener("reset", function (event) {
      event.preventDefault();
      search.value = "";
      filters.forEach(function (filter) { filter.element.value = ""; });
      apply();
    });
    apply();
  }

  function init() {
    document.querySelectorAll(".pip-table").forEach(enhance);
  }
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", init);
  else init();
})();
