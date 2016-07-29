
$(function(){

    $('#username').focus();

    $('#login_form').validate({

        submitHandler : function (form) {
			$(form).ajaxSubmit({
                url: '/',
                type: 'POST',
                beforeSubmit: function(formData, jqForm, options){
                    $('input[type=submit]').disable();
                },
                success: function(responseText,statusText){
                    if (responseText){
                        //alert('登录成功');
                        //$.cookie('username', $('#username').val(), {
                        //    expires: 30,
                        //    path: '/'
                        //})
                    }
                }
            })
		},

        errorLabelContainer: 'ol.input_error',
        wrapper: 'li',

        highlight : function (element, errorClass) {
			$(element).css('border', '1px solid #E74C3C');
		},

		unhighlight : function (element, errorClass) {
			$(element).css('border', '1px solid #9B59B6');
		},

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
});
