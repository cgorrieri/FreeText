/*!
 * Aloha Editor
 * Author & Copyright (c) 2010 Gentics Software GmbH
 * aloha-sales@gentics.com
 * Licensed unter the terms of http://www.aloha-editor.com/license.html
 */
define(
  ['aloha/plugin', 'aloha/floatingmenu', 'i18n!externalsave/nls/i18n', 'i18n!aloha/nls/i18n', 'aloha/jquery', 'css!externalsave/css/externalsave.css'],
  function(Plugin, FloatingMenu, i18n, i18nCore, jQuery) {
	

    var
    $ = jQuery,
    GENTICS = window.GENTICS,
    Aloha = window.Aloha;

    return Plugin.create('externalsave', {
      _constructor: function(){
        this._super('externalsave');
      },
		
      /**
     * Configure the available languages
     */
      languages: ['en', 'fr'],

		
      /**
     * Initialize the plugin
     */
      init: function () {
        var that = this;
        this.createButtons();
      },
		
      buttonClick: function() {
        var editables = [];
        $.each(Aloha.editables, function() {
          if(this.isModified())
            editables.push({
              key: this.obj.attr("data-key"),
              locale: this.obj.attr("data-locale"),
              content: this.getContents()
            });
        });
        if (editables.length > 0) {
          $.ajax({
            type: "PUT",
            url: "/free_texts",
            data: {
              "editables": editables
            },
            beforeSend: function ( xhr ) {
              var token = $("meta[name='csrf-token']").attr("content");
              xhr.setRequestHeader("X-CSRF-Token", token);
            },
            success: function(){
              console.debug("success");
            }
          });
        }
        return true;
      },
		
      /**
     * Initialize the buttons
     */
      createButtons: function () {
        var that = this;
	
        that.button = new Aloha.ui.Button({
          'iconClass' : 'aloha-button aloha-button-save',
          'size' : 'large',
          'onclick' : function () {
            that.buttonClick();
          }
        });
        FloatingMenu.addButton(
          'Aloha.continuoustext',
          that.button,
          i18nCore.t('floatingmenu.tab.format'),
          4
          );
      }
    });
  });