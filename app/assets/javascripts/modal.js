// var app = angular.module('myApp', []);
//
// app.config([
//     "$httpProvider", function($httpProvider) {
//         return $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
//     }
// ]);
// app.service('modal', [function() {
//     var modal = this;
//     modal.settings = {};
//     // Create the DOM elements for the modal
//     // The overlay fades out background content
//     modal.overlay = $('<div id="overlay"></div>');
//     // Create the #modal container, which houses the #content container and the #close button
//     modal.modal = $('<div id="modal"></div>');
//     modal.content = $('<div id="content"></div>');
//     modal.closeBtn = $('<div id="close"><i class="fa fa-times"></div>');
//
//     // Append the modal to the DOM
//     modal.modal.hide();
//     modal.overlay.hide();
//     modal.modal.append(modal.content, modal.closeBtn);
//
//     $(document).ready(function(){
//         $('body').append(modal.overlay, modal.modal);
//     });
//
//     modal.open = function (settings) {
//         // Save the settings for use when modal.close is called.
//         modal.settings = settings;
//         // settings.content is the id of the hidden div that houses the modal's content
//         // settings.elem is the id of the hidden container, which holds the content to
//         // be shown in the modal
//         var content = modal.settings.content;
//
//         // Size and position modal
//         modal.content.empty().append(content);
//         if(modal.settings.class) modal.modal.addClass(modal.settings.class);
//         if(modal.settings.height) modal.modal.css({ height: settings.height });
//         if(modal.settings.width) modal.modal.css({ width: settings.width });
//         if(modal.settings.content_height) modal.modal.css({ height: settings.content_height });
//         if(modal.settings.content_width) modal.modal.css({ width: settings.content_width });
//         if(modal.settings.fitToWindow) {
//             modal.settings.width = $(window).width() - 160;
//             modal.settings.height = $(window).height() - 160;
//         };
//         center(modal.settings.top);
//
//         $(window).bind('resize.modal', center);
//         // Show the modal
//         modal.modal.show();
//         modal.overlay.show();
//
//         // Bind event listeners for closing the modal
//         $(modal.closeBtn).add(modal.overlay).on('click', function(e) {
//             e.stopPropagation();
//             modal.close();
//         });
//         $(document).on('keyup', function(e) {
//             if (e.keyCode == 27) {
//                 modal.close();
//                 // Unbind the escape-key event listener.
//                 $(document).unbind('keyup');
//             }
//         })
//     };
//
//     modal.close = function() {
//         // Set the content and it's container (elem) so that we can move the content
//         // back from the modal's content container to its original hidden container.
//         var elem = modal.settings.elem;
//         var content = modal.settings.content;
//
//         // Move the content back into the original container
//         elem.empty().append(content);
//
//         // Hide the modal
//         modal.modal.hide();
//         modal.overlay.hide();
//         modal.content.empty();
//         $(window).unbind('resize.modal');
//     };
//
//     function center(top) {
//         // This function centers the modal horizontally and sets the vertical positioning
//         if(!top || !isInt(top)) top = 130;
//         var mLeft = -1 * modal.modal.width() / 2;
//         modal.modal.css({
//             top: top + 'px',
//             left: '50%',
//             marginLeft: mLeft
//         });
//         function isInt(n) {
//            return n % 1 === 0;
//         }
//     }
// }]);
// app.controller('MyController', ['$scope', 'modal', function($scope, modal) {
//     $scope.open = function(prefix) {
//         modal.open({
//             content: $(prefix + '_1'),
//             elem: $(prefix + '_1_container')
//         })
//     };
//
//     $scope.close = function() {
//         modal.close();
//     }
// }]);
//
// app.run();
