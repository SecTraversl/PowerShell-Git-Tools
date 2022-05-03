# Script name: Invoke-GitSyncScript.ps1

# Changing to this directory in order to run the "git" commands in the proper local git repo
# Set-Location "~\Documents\<some-existing-git-rep>"


# Code 
$gstatus = git status --porcelain

$gstatus = $gstatus -join "`r`n"
$gstatus = $gstatus -replace '"',"'"

if ($null -ne $gstatus) {
    git add --all
    git commit -m "Automated sync: $gstatus"
    git pull --rebase
    git push
}