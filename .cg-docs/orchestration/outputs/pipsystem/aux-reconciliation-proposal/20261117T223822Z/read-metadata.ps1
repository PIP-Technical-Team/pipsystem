$ErrorActionPreference = 'Stop'
$checkout='E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$output="$checkout/.cg-docs/orchestration/outputs/pipsystem/aux-reconciliation-proposal/20261117T223822Z"
$scratch="$checkout/.tmp/arp/20261117T223822Z"
$library="$checkout/.tmp/one-survey/qmd-acceptance-20261113/library"
$previous=@{}
try {
    foreach($key in @('TEMP','TMP','TMPDIR','PSModuleAnalysisCachePath')) {
        $previous[$key]=[Environment]::GetEnvironmentVariable($key,'Process')
        $value=if($key -eq 'PSModuleAnalysisCachePath'){"$output/ps-modulecache"}else{$output}
        [Environment]::SetEnvironmentVariable($key,$value,'Process')
    }
    if(!(Test-Path -LiteralPath $output)) { throw 'Missing E output parent' }
    . "$checkout/experiments/one-survey/paths.ps1"
    Assert-OneSurveyTree $output -Output
    Assert-OneSurveyTree $scratch -Output
    Assert-OneSurveyTree $library
    if(!(Test-Path -LiteralPath "$checkout/.tmp")) { throw 'Missing E temp parent' }
    foreach($folder in @('temp','home','cache','config')) {
        [IO.Directory]::CreateDirectory("$scratch/$folder") | Out-Null
    }
    $settings=@{
        TEMP="$scratch/temp";TMP="$scratch/temp";TMPDIR="$scratch/temp"
        HOME="$scratch/home";R_USER="$scratch/home";USERPROFILE="$scratch/home"
        APPDATA="$scratch/config";LOCALAPPDATA="$scratch/cache"
        XDG_CACHE_HOME="$scratch/cache";XDG_CONFIG_HOME="$scratch/config"
        XDG_DATA_HOME="$scratch/home";XDG_STATE_HOME="$scratch/cache"
        R_USER_CACHE_DIR="$scratch/cache";R_USER_CONFIG_DIR="$scratch/config"
        R_USER_DATA_DIR="$scratch/home";R_USER_DATA_DIR_BASE="$scratch/home"
        R_LIBS=$library;R_LIBS_USER='NULL';R_LIBS_SITE='NULL'
        R_DEFAULT_PACKAGES='utils,stats,methods';R_SESSION_TMPDIR='';R_TESTS=''
        R_ENVIRON="$scratch/config/no-site";R_ENVIRON_USER="$scratch/config/no-user"
        R_PROFILE="$scratch/config/no-site-profile";R_PROFILE_USER="$scratch/config/no-profile"
        R_HISTFILE="$scratch/cache/history";R_ENABLE_JIT='0'
        R_MAKEVARS_USER="$scratch/config/no-makevars";R_MAKEVARS_SITE="$scratch/config/no-site-makevars"
        RENV_CONFIG_AUTOLOADER_ENABLED='FALSE';RENV_PATHS_ROOT="$scratch/cache/renv"
        R_PKG_CACHE_DIR="$scratch/cache/pkg";R_HOME='C:/Program Files/R/R-4.5.2'
        R_ARCH='/x64';R_SHARE_DIR='C:/Program Files/R/R-4.5.2/share'
        R_INCLUDE_DIR='C:/Program Files/R/R-4.5.2/include';R_DOC_DIR='C:/Program Files/R/R-4.5.2/doc'
        PSModuleAnalysisCachePath="$scratch/cache/ModuleAnalysisCache"
        ARP_SCRATCH=$scratch;ARP_OUTPUT=$output
    }
    foreach($key in $settings.Keys) {
        if(!$previous.ContainsKey($key)) {
            $previous[$key]=[Environment]::GetEnvironmentVariable($key,'Process')
        }
        [Environment]::SetEnvironmentVariable($key,$settings[$key],'Process')
    }
    Assert-OneSurveyTree $scratch -Output
    $ErrorActionPreference='Continue'
    & 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe' --vanilla "$output/read-metadata.R" *> "$output/metadata-reader.log"
    $result=$LASTEXITCODE
    "Metadata-only reader exit: $result; log: $output/metadata-reader.log"
    if($result -ne 0) { throw 'Metadata-only ranking failed; no chronology inferred' }
} finally {
    foreach($key in $previous.Keys) {
        [Environment]::SetEnvironmentVariable($key,$previous[$key],'Process')
    }
}
