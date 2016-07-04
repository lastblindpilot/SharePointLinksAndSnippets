#   Thanks to Matthew Yarlett
#   http://matthewyarlett.blogspot.ru/2012/07/creating-new-terms-in-taxonomy-store.html

if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

# Get the Taxonomy Session for your site
$ts = Get-SPTaxonomySession -Site "https://site"
$tstore = $ts.TermStores[0]

# List the term groups (if you don't know the name)
$tstore.Groups | ft name

# Get the term group
$tgroup = $tstore.Groups["People"]

# List the term sets if you don' t know the name
$tgroup.TermSets | FT Name

# Get the termset
$eTypeTS = $tgroup.TermSets["Department"]

# Create a new term (the CreateTerm method can be call with just two parameters, the name and locale id, if you're happy for SharePoint to automatically generate a Guid for the terms ID).
$eTypeTS.CreateTerm("New term", 1049)

# When you're finished creating terms, update the termgroup to commit the changes.
$tgroup.TermStore.CommitAll()