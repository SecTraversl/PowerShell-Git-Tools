<#
.SYNOPSIS
  The "Invoke-GitSyncScript" function can be used to automatically commit changes to an existing remote repository.

.EXAMPLE

.NOTES
  Name:  Invoke-GitSyncScript.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-05-03 | Initial Version
  Dependencies:  
  Notes:
  - 

  .
#>
function Invoke-GitSyncScript {
  [Alias('GitSyncScript')]
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $Directory = '.'
  )
    
  begin {}
  
  process {

    Set-Location $Directory
    
    if ($MyInvocation -match '^(\s+)?\.\s+') {
      # If we are in this block then this tool is being dot-sourced, so we do not execute any meaningful code here, instead we place the meaningful code in the 'else' block so that when the function is called the meaningful code will run

      # INTERESTINGLY ENOUGH... statements here seem to never be executed, even if this block seems to be matched... 
    }
    else {
      # This block is run when we call the function like we would a cmdlet that is already loaded in the powershell terminal

      $gstatus = git status --porcelain

      $gstatus = $gstatus -join "`r`n"
      $gstatus = $gstatus -replace '"',"'"
      
      if ($null -ne $gstatus) {
          git add --all
          git commit -m "Automated sync: $gstatus"
          git pull --rebase
          git push
      }

    }

  }
  
  end {}
}
  
if ("$($MyInvocation.InvocationName)" -match [regex]::Escape("$($MyInvocation.MyCommand)")) {
  # This 'if' block will run when the end user is running this as a script, e.g.  ".\Test-MyInvocation.ps1"
  # - Here we call the function that was defined above, so that if the user does run this file as a script, the function will be invoked as intended
  Invoke-GitSyncScript
}
