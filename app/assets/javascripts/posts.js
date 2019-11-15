// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {
  $('a').click(function(event) {
    if ($(`#${event.target.id}`).attr('class') === 'commentlike') {
      updateCommentLikesInfo(event)
    } else {
      var postID = $(`#${event.target.id}`).attr('value')
      var data = { post_id: postID }
      $.ajax({
        url: "/likes/postinfo",
        type: "POST",
        data: { post_id: postID },
        success: function(resp) {
          updateLikesInfo(postID, event);
        }
      });
    };
  });

  function updateLikesInfo(postID, event) {
    $.get('/likes/getinfo', function(data) {
      $(`#postlikecount-${postID}`).text(`${data.likecount} `);
      $(`#postlikedby-${postID}`).text(`${data.likedby} `);
      if(data.exists) {
        $(`#${event.target.id}`).text('👎');
      } else {
        $(`#${event.target.id}`).text('👅');
      }
    });
  };

  function updateCommentLikesInfo(event) {
    var commentID = $(`#${event.target.id}`).attr('value')
    var data = { comment_id: commentID }
    $.ajax({
      url: "/comment-likes/postinfo",
      type: "POST",
      data: { comment_id: commentID },
      success: function(resp) {
        $.get('/comment-likes/getinfo', function(data) {
          $(`#commentlikecount-${commentID}`).text(`${data.clikecount} `);
          if(data.exists) {
            $(`#${event.target.id}`).text('Unlick');
          } else {
            $(`#${event.target.id}`).text('Lick');
          }
        });
      }
    });
  };
});
