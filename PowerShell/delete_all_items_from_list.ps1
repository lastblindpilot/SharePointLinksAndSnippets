# SAY GOODBYE
# todo: create a function for this
# note: it's fun to delete users

write-host "This will delete data, type Y to continue"
$retval = read-host 
if ($retval -ne "Y") 
{
    write-host "exiting - you did not type yes" -foregroundcolor green
    exit
}
write-host "continuing"

$web = get-spweb "https://intra.rtlabs.ru/kpi"
$list = $web.lists["Сотрудники"]
Write-host "List $($list.title) has $($list.items.count) entries"
$items = $list.items
foreach ($item in $items)
{
    Write-host "  --->  Say Goodbye to $($item.Title)" -foregroundcolor red
    $list.getitembyid($Item.id).Delete()
}