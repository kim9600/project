$(document).ready(function(){
    
    (function($) {
        "use strict";

    
    jQuery.validator.addMethod('answercheck', function (value, element) {
        return this.optional(element) || /^\bcat\b$/.test(value)
    }, "type the correct answer -_-");

    // validate contactForm form
    $(function() {
        $('#contactForm').validate({
            rules: {
                id: {
                    required: true,
                    minlength: 4
                },
                password: {
                    required: true,
                    minlength: 6
                },
                password2: {
                    required: true,
                    minlength: 6
                },
                name: {
                    required: true,
                    minlength: 2
                },
                eng_Lastname: {
                    required: true,
                    minlength: 1
                },
                eng_Firstname: {
                    required: true,
                    minlength: 1
                },
                birth: {
                    required: true,
                    minlength: 7
                },
                email: {
                    required: true,
                    email: true
                },
                phone: {
                    required: true,
                    minlength: 4
                }
            },
            messages: {
                id: {
                    required: "Insert ID Please",
                    minlength: "your ID must consist of at least 4 characters"
                },
                password: {
                    required: "Insert Password Please",
                    minlength: "your password must consist of at least 6 characters"
                },
                password2: {
                    required: "Insert Password Please",
                    minlength: "your password must consist of at least 6 characters"
                },
                name: {
                    required: "Insert your Full-Name Please",
                    minlength: "your name must consist of at least 2 characters"
                },
                eng_Lastname: {
                    required: "Insert your Last-Name in English Please",
                    minlength: "your name must consist of at least 1 characters"
                },
                eng_Firstname: {
                    required: "Insert your First-Name in English Please",
                    minlength: "your name must consist of at least 1 characters"
                },
                birth: {
                    required: "Insert your birth Please",
                    minlength: "your birth must consist of at least 7 characters"
                },
                email: {
                    required: "no email, no message"
                },
                phone: {
                    required: "Insert your number Please",
                    minlength: "your Number must consist of at least 4 characters"
                }
            },
        })
    })
        
 })(jQuery)
})