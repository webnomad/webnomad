<!doctype html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Make the world your workplace - Webnomad</title>
        <meta name="description" content="Find a local place to work, get connected to other remote workers." />
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,900,900italic' rel='stylesheet' type='text/css' />
        <style type="text/css" media="screen">
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
                font-family: Roboto, Sans-Serif;
                background-color: #f6f6f6;
            }
            * {
                box-sizing: border-box;
            }
            body > header {
                width: 100%;
                height: 100%;
                overflow: hidden;
                position: relative;
            }
            body > header > img {
                width: 100%;
                height: 100%;
                filter: brightness(50%);
            }
            body > header > h1 {
                font-size: 5em;
                top: 50px;
            }
            body > header > h2 {
                top: 170px;
            }
            body > header > h1,
            body > header > h2 {
                position: absolute;
                left: 12.5%;
                color: #fff;
                text-shadow: 0 0 5px #000;
            }

            .earlybird {
                position: absolute;
                background: rgba(0, 0, 0, .6);
                width: 75%;
                margin: auto;
                padding: 30px 50px;
                top: 260px;
                left: 12.5%;
                color: #fff;
            }
            .earlybird p {
                font-size: 1.2em;
            }

            #mc_embed_signup form {
                padding: 0 !important;
            }
            #mc_embed_signup input[type=email] {
                border: 1px solid #ccc;
                width: 73%;
                font-size: 1.2em;
            }
            #mc_embed_signup input[type=submit] {
                border: 1px solid #ccc;
                background-color: rgba(243, 174, 115, .85);
                color: #fff;
                text-transform: uppercase;
                width: 25%;
                margin-left: 1%;
            }
            #mc_embed_signup input[type=submit]:hover {
                background-color: rgba(243, 174, 115, .93);
            }
            #mc_embed_signup input {
                font: inherit;
                padding: 15px 30px;
                height: 60px;
                display: inline;
            }
        </style>

        <script src="/js/dependencies/sails.io.js"></script>
    </head>

    <body>
        <header>
            <img src="/images/homebackground.jpg" />
            <h1>WebNomad</h1>
            <h2>Make the world your workplace.</h2>
            <section class="earlybird">
                <p>Do you want an account before everyone else? We are looking for <strong>VIP beta users</strong>.</p>
                <link href="//cdn-images.mailchimp.com/embedcode/classic-081711.css" rel="stylesheet" type="text/css">
                <div id="mc_embed_signup">
                    <div class="status">
                        <ul></ul>
                    </div>
                    <!--<form action="//webnomad.us10.list-manage.com/subscribe/post?u=735ba3557e2c5354d25f81d93&amp;id=fa6899f128" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
                        <div id="mc_embed_signup_scroll">
                            <input type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL" placeholder="Enter your email address">
                            <input style="position: absolute; left: -5000px;" type="text" name="b_735ba3557e2c5354d25f81d93_fa6899f128" tabindex="-1" value="">
                            <input type="submit" value="Let me know!" name="subscribe" id="mc-embedded-subscribe">

                            <div id="mce-responses" class="clear">
                                <div class="response" id="mce-error-response" style="display:none"></div>
                                <div class="response" id="mce-success-response" style="display:none"></div>
                            </div>
                        </div>
                    </form>-->
                    <form action="/user/create" method="post" id="mc-embedded-subscribe-form" class="validate" novalidate>
                        <div id="mc_embed_signup_scroll">
                            <input type="email" value="" name="email" class="required email" required="required" placeholder="Enter your email address">
                            <input style="position: absolute; left: -5000px;" type="text" name="b_735ba3557e2c5354d25f81d93_fa6899f128" tabindex="-1" value="">
                            <input type="submit" value="Let me know!" name="subscribe" id="mc-embedded-subscribe">

                            <div id="mce-responses" class="clear">
                                <div class="response" id="mce-error-response" style="display:none"></div>
                                <div class="response" id="mce-success-response" style="display:none"></div>
                            </div>
                        </div>
                    </form>
                    <script>

                    var Status = {
                        add: function(status, msg) {
                            var status = status || 'info';
                            var statusDom = document.querySelectorAll('.status');
                            var li = document.createElement('li');
                            li.classList.add(status);
                            li.innerHTML = msg;
                            debugger;
                            [].forEach(statusDom, function(item, i) {
                                this.querySelector('> ul').appendChild(li);
                            });
                        }
                    }

                    var attributes = ['email'];
                    document.querySelector('#mc-embedded-subscribe-form').onsubmit = function(evt) {
                        evt.preventDefault();
                        var data = {};
                        [].forEach.call(this, function(item) {
                            if(attributes.indexOf(item.name) >= 0) {
                                data[item.name] = item.value;
                            }
                        })
                        io.socket.request({url: '/user', data: data, method: 'post'}, function(user, res) {
                            if(res.statusCode > 203) {
                                Status.add('error', "Please check that the email is valid.");
                            }
                        });
                    }
                    </script>
            </section>
        </header>
        <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-59484449-1', 'auto');
          ga('send', 'pageview');

        </script>
    </body>
</html>
