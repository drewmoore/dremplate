(function() {
  $(document).ready(initialize);

  function initialize() {
    $('#add-content').click(addContent);
  }

  function addContent(event) {
    pageId = $('#contents-menu').attr('data-id');
    contentId = $('#contents-menu').val();

    console.log('addContent: ', pageId, contentId);

    $.ajax({type: 'post', url: '/pages/add-content', data: {contentId:contentId, pageId:pageId}, success: function(data){
      console.log('');
    }});

    event.preventDefault();
  }
})();
