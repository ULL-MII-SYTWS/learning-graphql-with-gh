# Description: List all repos in the organization prueba
# requirement: install gh extension org-browse-repo
gh org-browse-repo -S prueba -d -o ULL-ESIT-DMSI-1920 |  sed -nE 's/gh browse -R|$//p' | sort