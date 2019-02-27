(function ($) {
       $(document).ready(function(){
            $.getJSON("https://api.meetup.com/2/groups?callback=?&sign=true&api&key=3f5816c3734b5b496e381b1221&photo-host=public&zip=97201&category_id=34&radius=30&page=200", 
    function (data) {
        var htmlString = "";
        $.each(data.results, function (i, item) {
            var picture = "http://placehold.it/320x150";
        try {
           if (typeof(item.group_photo['photo_link']) != "undefined"){
                picture = item.group_photo['photo_link'];
            }else {
                picture = "http://placehold.it/320x150";
            }
        }catch (err){
            // do nothing.
    }

        htmlString += '<div class="col-sm-4 col-lg-4 col-md-4"> <div class="thumbnail"> <img src="' + picture + '" alt="' + item.name + '" height="150" width="320"> <div class="caption"><h4><a href="' + item.link + '" target="_blank">' + item.name + '</a></h4> ' + item.description + ' </div><div class="ratings"><p><a href="' + item.link + 'join/" target="_blank">Join this group</a> ' + item.members + ' Members</p> <p></p> </div> </div> </div>';
        //htmlString += '<img src="' + item.group_photo + '"><a href="' + item.link + '" target="_blank">' + item.name + '</a></img>';
        console.log(htmlString);
        });
    $('#groups').html(htmlString);});
    });
})(jQuery);