// Generated by CoffeeScript 1.7.1

/**
 * 
 * @date: 2014-02-22 11:31:01
 * @author: vfasky (vfasky@gmail.com)
 * @link: http://vfasky.com
 * @version: $Id$
 */

(function() {
  var Sequelize, config, database, fs, lodash, path, sequelize,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  fs = require('fs');

  path = require('path');

  config = require('../config');

  Sequelize = require('sequelize');

  lodash = require('lodash');

  database = {};

  sequelize = new Sequelize(config.equelize_database, config.equelize_username, config.equelize_password, {
    dialect: config.equelize_dialect,
    host: config.equelize_host,
    port: config.equelize_port,
    maxConcurrentQueries: config.equelize_max_con,
    pool: config.equelize_pool
  });

  fs.readdirSync(__dirname).filter(function(file) {
    return file.indexOf('.coffee') === -1 && file.indexOf('.') !== 0 && file !== 'index.js';
  }).forEach(function(file) {
    var model;
    model = sequelize["import"](path.join(__dirname, file));
    return database[model.name] = model;
  });

  Object.keys(database).forEach(function(modelName) {
    if (__indexOf.call(database[modelName], 'associate') >= 0) {
      return database[modelName].associate(database);
    }
  });

  module.exports = lodash.extend({
    sequelize: sequelize,
    Sequelize: Sequelize
  }, database);

}).call(this);