<#
.SYNOPSIS
  The "Invoke-GitCommitLocal" function takes a given local repo folder name and loops over the contents of the folder to add the "LastWriteTime" as the specified 'commit --date' in order to properly annotate the times when contributions were made (which is reflected in the contribution graph reflected on Github).

.EXAMPLE

.NOTES
  Name:  Invoke-GitCommitLocal.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-23 | Initial version (replaces previous tools)
  Dependencies:  Assumes primary repo name is "main" not "master"
  Notes:
  - This was helpful:  https://stackoverflow.com/questions/19742345/what-is-the-format-for-date-parameter-of-git-commit


  .
#>
function Invoke-GitCommitLocal {
  [CmdletBinding()]
  [Alias('GitCommitLocal')]
  param (
    [Parameter(Mandatory)]
    [string]
    $Folder
  )
  
  begin {}
  
  process {

    $FolderObj = Get-Item $Folder
    $FileObjects = Get-ChildItem -Path $FolderObj -Recurse
    foreach ($FileObj in $FileObjects) {
      git add $FileObj.FullName
      git commit --date="$($FileObj.LastWriteTime)" -m "Last write time $($FileObj.LastWriteTime.ToString('yyyy-MM-dd'))"
    }    

  }
  
  end {}
}