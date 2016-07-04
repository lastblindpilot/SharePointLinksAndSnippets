// Get Items From List

function getListItems(url, listname, query, complete, failure) {
    $.ajax({
        url: url + "/_api/web/lists/getbytitle('" + listname + "')/items" + query,
        method: "GET",
        headers: { "Accept": "application/json; odata=verbose" },
        success: function (data) {
            complete(data.d.results); 
        },
        error: function (data) {
            failure(data);
        }
    });
}

function groupBy(items,propertyName) {
    var result = [];
    $.each(items, function(index, item) {
       if ($.inArray(item[propertyName], result)==-1) {
          result.push(item[propertyName]);
       }
    });
    return result;
}

getListItems('https://tenant.sharepoint.com/project','Tasks','?select=Title',
    function(items){    
       var taskNames = groupBy(items,'Title');
       console.log(taskNames);
    },
    function(error){
       console.log(JSON.stringify(error));
    }
);