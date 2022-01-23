<#
.SYNOPSIS
  Short description
.EXAMPLE
  PS C:\> <example usage>
  Explanation of what the example does
.NOTES
  Name:  .ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-08 | Initial Version
  Dependencies:  
  Notes:
  - I retrieved this idea from:  https://webapps.stackexchange.com/questions/41799/how-can-i-list-people-who-have-starred-my-github-repository

  .
#>
function Find-GitHubStargazers {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string[]]
    $GitHubRepositoryURI
  )
  
  begin {}
  
  process {
    
  }
  
  end {}
}