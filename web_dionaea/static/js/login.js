
$(function(){

    $('#username').focus();

    $('#login_form').validate({

        submitHandler : function (form) {
			$(form).ajaxSubmit({
                url: '/',
                type: 'POST',
                success: function(responseText,statusText){
                    $('.input_error').css('display', 'block').html('<li>' + responseText.messages + '</li>');
                    $('#login_form').resetForm();
                }
            })
		},

        errorLabelContainer: 'ol.input_error',
        wrapper: 'li',
        rules: {
            username: {
                required: true,
                minlength: 2,
                rangelength : [2,15]
            },
            password: {
                required: true,
                minlength: 6
            }
        },
        messages: {
            username: {
                required: '用户名不能为空',
                minlength: '用户名不得小于 {0} 位'
            },
            password: {
                required: '密码不能为空',
                minlength: '密码不得小于 {0} 位'
            }
        }
    })

    $('#id_username').focus(function () {
        $('#tip').text('');
    })
});
