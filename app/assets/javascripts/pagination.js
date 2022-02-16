console.log(2)

  	$(window).scroll(function() {
      var more_posts_url = $('.pagination .next_page ').attr('href')
      console.log(more_posts_url)
        if (more_posts_url && ($(window).scrollTop() > $(document).height() - $(window).height() - 60)) {
            $('.pagination').text('Please wait...')
             $.getScript(more_posts_url)
        }
    })


//       / $(document).ready(function() {
// //   if ($('.pagination').length) {
// //     $(window).scroll(function() {
// //       var url = $('.pagination .next_page').attr('href');
// //       if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
// //         $('.pagination').text("Please Wait...");
// //         return $.getScript(url);
// //       }
// //     });
// //     return $(window).scroll();
// //   }
// // });