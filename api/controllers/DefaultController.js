/**
 * DefaultController
 *
 * @description :: Server-side logic for managing defaults
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {



  /**
   * `DefaultController.home()`
   */
  home: function (req, res) {
    return res.render('homepage', {
      name: 'Vincent'
    });
  }
};

