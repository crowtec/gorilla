// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require clmtrackr
//= require model_pca_20_svm_emotionDetection
//= require emotionmodel
//= require emotion_classifier
//= require_tree .

$(function () {
    if (annyang) {
        // Let's define a command.
        var commands = {
            'Tres tristes tigres comen trigo en un trigal': function () {
                $("#read-sentence").html("Tres tristes trigres comen trigo en un trigal");
                $("#correct-read").css({
                    opacity: 1
                });
            },
            'son las tres': function () {

            }
        };


        // Add our commands to annyang
        annyang.addCommands(commands);

        annyang.addCallback('error', function () {
            console.log("error");
        });

        annyang.addCallback('resultMatch', function (userSaid, commandText, phrases) {
            console.log(userSaid); // sample output: 'hello'
            console.log(commandText); // sample output: 'hello (there)'
            console.log(phrases); // sample output: ['hello', 'halo', 'yellow', 'polo', 'hello kitty']
        });

        annyang.addCallback('resultNoMatch', function (userSaid, commandText, phrases) {
            $("#read-sentence").html(userSaid[0]);
            console.log(userSaid);

        });


        annyang.addCallback('result', function (userSaid) {
            //$("#read-sentence").html(userSaid[0]);
            console.log(userSaid); // sample output: ['hello', 'halo', 'yellow', 'polo', 'hello kitty']
        });

        annyang.setLanguage('es-ES');
        // Start listening.
        annyang.start({autoRestart: false, continuous: false});
        //annyang.start({ autoRestart: true, continuous: false });
    }
});

