include FreeTextRepositoryHelper

FreeText.setup do |config|
  # See aloha-editor.org

  #config.authentication = Proc.new { |controller| controller.admin_signed_in? }

  # If set, it always start with ','
  config.plugins = ",common/table,common/link,common/list,common/undo,common/contenthandler,common/image,extra/browser,extra/linkbrowser"

  # Static settings of aloha
  config.settings = <<-JAVASCRIPT
  logLevels : {'error': false,'warn': false, 'info': false, 'debug': false, 'deprecated': false },
  locale: 'fr',
  plugins: {
    format: {
      config: ['b', 'i', 'u', 'sub', 'sup', 'p','h1', 'h2', 'h3', 'removeFormat'],
      editables: {
        '.content': ['b', 'i', 'u', 'sub', 'sup', 'p', 'h2', 'h3', 'removeFormat'],
        '.text_only': ['b', 'i', 'u', 'sup', 'removeFormat']
      },
      // those are the tags that will be cleaned when clicking 'remove formatting'
      removeFormats: [ 'strong', 'em', 'b', 'i', 'cite', 'q', 'code', 'abbr', 'del', 'sub', 'sup']
    },
    list: {
      config: ['ul', 'ol'],
      editables: {
        '.text_only': []
      }
    },
    link: {
      // all elements with no specific configuration may insert links
      config: [ 'a' ],
      /*hotKey: {
        // use ctrl+l instead of ctrl+k as hotkey for inserting a link
        //insertLink: 'ctrl+l'
      },*/
      editables: {
        // No links in the title.
        '.text_only': []
      },
      target: '_blank',
      // the same for css class as for target
      //cssclassregex: '^(?!.*aloha-editor.com).*',
      //cssclass: 'aloha',
      // use all resources of type website for autosuggest
      //objectTypeFilter: ['website'],
      // handle change of href
      /*onHrefChange: function ( obj, href, item ) {
        var jQuery = Aloha.require( 'aloha/jquery' );
        if ( item ) {
          jQuery( obj ).attr( 'data-name', item.name );
        } else {
          jQuery( obj ).removeAttr( 'data-name' );
        }
      }*/
    },
    table: {
      // all elements with no specific configuration are not allowed to insert tables
      config: [ 'table' ],
      editables: {
        // Don't allow tables in top-text
        '.text_only': []
      },
      summaryinsidebar: true,
      // [{name:'green', text:'Green', tooltip:'Green is cool', iconClass:'GENTICS_table GENTICS_button_green', cssClass:'green'}]
      tableConfig: [
        { name: 'hor-minimalist-a' },
        { name: 'box-table-a' },
        { name: 'hor-zebra' },
      ],
      columnConfig: [
        { name: 'table-style-bigbold', iconClass: 'aloha-button-col-bigbold' },
        { name: 'table-style-redwhite', iconClass: 'aloha-button-col-redwhite' }
      ],
      rowConfig: [
        { name: 'table-style-bigbold', iconClass: 'aloha-button-row-bigbold' },
        { name: 'table-style-redwhite', iconClass: 'aloha-button-row-redwhite' }
      ]
    },
    image: {
      config:{
        'fixedAspectRatio' : false,
        'maxWidth' : 600,
        'minWidth' : 20,
        'maxHeight' : 600,
        'minHeight' : 20,
        'globalselector' : '.global',
        'ui': {
          'oneTab': true
        }
      },
      editables: {
        // Don't allow tables in top-text
        '.text_only': []
      },
      'fixedAspectRatio' : false,
      'maxWidth' : 600,
      'minWidth' : 20,
      'maxHeight' : 600,
      'minHeight' : 20,
      'globalselector' : '.global',
      'ui': {
        'oneTab' : true,
        'align' : false,
        'margin' : false
      }
    },
    cite: {
      referenceContainer: '#references'
    },
    formatlesspaste :{
      formatlessPasteOption : true,
      strippedElements : [
        'em',
        'strong',
        'small',
        's',
        'cite',
        'q',
        'dfn',
        'abbr',
        'time',
        'code',
        'var',
        'samp',
        'kbd',
        'sub',
        'sup',
        'i',
        'b',
        'u',
        'mark',
        'ruby',
        'rt',
        'rp',
        'bdi',
        'bdo',
        'ins',
        'del'
      ]
    }
  },
JAVASCRIPT

  # get an hash wich define a list of items
  config.getRepositories = Proc.new { |c| FreeTextRepositoryHelper.get_repositories(c) }

end