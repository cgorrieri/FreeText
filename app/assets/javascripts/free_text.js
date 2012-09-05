Aloha.ready( function() {
  // Make #content editable once Aloha is loaded and ready.
  Aloha.jQuery('div.free_text_aloha').aloha();
});

/**
 * Create the Aloha Repositories object.
 */
new ( Aloha.AbstractRepository.extend( {

  _constructor: function () {
    this._super( 'Documents' );
  },

  /**
   * initalize the repository
   */
  init: function () { },


  /**
   * Searches a repository for object items matching queryString if none found returns null.
   * The returned object items must be an array of Aloha.Repository.Object
   *
   * @param {object} params object with properties
   * @property {String} queryString
   * @property {array} objectTypeFilter OPTIONAL Object types that will be returned.
   * @property {array} filter OPTIONAL Attributes that will be returned.
   * @property {string} inFolderId OPTIONAL his is a predicate function that tests whether or not a candidate object is a child-object of the folder object identified by the given inFolderId (objectId).
   * @property {string} inTreeId OPTIONAL This is a predicate function that tests whether or not a candidate object is a descendant-object of the folder object identified by the given inTreeId (objectId).
   * @property {array} orderBy OPTIONAL ex. [{lastModificationDate:’DESC’}, {name:’ASC’}]
   * @property {Integer} maxItems OPTIONAL number items to return as result
   * @property {Integer} skipCount OPTIONAL This is tricky in a merged multi repository scenario
   * @property {array} renditionFilter OPTIONAL Instead of termlist an array of kind or mimetype is expected. If null or array.length == 0 all renditions are returned. See http://docs.oasis-open.org/cmis/CMIS/v1.0/cd04/cmis-spec-v1.0.html#_Ref237323310 for renditionFilter
   * @param {function} callback this method must be called with all result items
   */
  query: function ( p, callback ) {
    callback.call( this, [
//    {
//      id: 'home_link',
//      name: 'Home',
//      url: 'http://localhost:3000/',
//      baseType: 'document',
//      type: 'text/html'
//    }
    ]);
  },

  /**
   * Returns all children of a given motherId.
   *
   * @param {object} params object with properties
   * @property {array} objectTypeFilter OPTIONAL Object types that will be returned.
   * @property {array} filter OPTIONAL Attributes that will be returned.
   * @property {string} inFolderId OPTIONAL his is a predicate function that tests whether or not a candidate object is a child-object of the folder object identified by the given inFolderId (objectId).
   * @property {array} orderBy OPTIONAL ex. [{lastModificationDate:’DESC’}, {name:’ASC’}]
   * @property {Integer} maxItems OPTIONAL number items to return as result
   * @property {Integer} skipCount OPTIONAL This is tricky in a merged multi repository scenario
   * @property {array} renditionFilter OPTIONAL Instead of termlist an array of kind or mimetype is expected. If null or array.length == 0 all renditions are returned. See http://docs.oasis-open.org/cmis/CMIS/v1.0/cd04/cmis-spec-v1.0.html#_Ref237323310 for renditionFilter
   * @param {function} callback this method must be called with all result items
   */
  getChildren: function ( p, callback ) {
    callback.call( this, [
//    {
//      id: 'home_link',
//      name: 'Home',
//      url: 'http://localhost:3000/',
//      baseType: 'document',
//      type: 'text/html'
//    }
    ]);
  },

  /**
   * Get the repositoryItem with given id
   * Callback: {Aloha.Repository.Object} item with given id
   * @param itemId {String} id of the repository item to fetch
   * @param callback {function} callback function
   */
  getObjectById: function ( itemId, callback ) {
    callback.call( this, [
//    {
//      id: 'home_link',
//      name: 'Home',
//      url: 'http://localhost:3000/',
//      baseType: 'document',
//      type: 'text/html'
//    }
    ]);
  },

  /**
   * Mark or modify an object as needed by that repository for handling, processing or identification.
   * Objects can be any DOM object as A, SPAN, ABBR, etc..
   * (see http://dev.w3.org/html5/spec/elements.html#embedding-custom-non-visible-data)
   * @param obj jQuery object to make clean
   * @return void
   */
  markObject: function (obj, repositoryItem) {
    obj.attr('data-Documents-temporary-data').text( resourceItem.name );
  },

  /**
   * Make the given jQuery object (representing an object marked as object of this type)
   * clean. All attributes needed for handling should be removed.
   * @param {jQuery} obj jQuery object to make clean
   * @return void
   */
  makeClean: function ( obj ) {
    obj.removeAttr('data-Documents-temporary-data');
  }

}))();