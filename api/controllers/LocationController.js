/**
 * LocationController
 *
 * @description :: Server-side logic for managing locations
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {



  /**
   * `LocationController.home()`
   */
  home: function (req, res) {
    return res.render('location');
  },


  /**
   * `LocationController.add()`
   */
  add: function (req, res) {
    return res.json({
      todo: 'add() is not implemented yet!'
    });
  }
};

