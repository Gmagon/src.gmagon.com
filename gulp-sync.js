
'use strict';

var gulp = require('gulp');
var fileSync = require('gulp-file-sync');
var git = require('gulp-git');
var gulpSequence = require('gulp-sequence');

const sysFS = require('fs')
const sysPath = require('path')

const ignoreFils = ['CNAME','.git', '.idea', '.gitignore', '.npmignore', '.travis.yml', '.travis', 'node_modules']
var g_sync_dir = ""

gulp.task('sync:git:pull:xxxx', function(cb){
  git.pull('origin', ['master'], {cwd:g_sync_dir}, function(err){
      if (err) throw err;
      cb (err)
  })
})

gulp.task('sync:files:xxxx', ['sync:git:pull:xxxx'], function(){
   fileSync('public', g_sync_dir, {
     ignore: ignoreFils
   })
})

gulp.task('sync:git:add:xxxx', ['sync:files:xxxx'], function(){
  return  gulp.src(g_sync_dir)
    .pipe(git.add({cwd:g_sync_dir, quiet:false}))
})

gulp.task('sync:git:commit:xxxx', ['sync:git:add:xxxx'], function(){
  return  gulp.src(g_sync_dir)
    .pipe(git.commit('sync update commit', {cwd:g_sync_dir, quiet:false}))
})

gulp.task('sync:xxxx', ['sync:git:commit:xxxx'], function(cb){
  git.push('origin', ['master'], {cwd:g_sync_dir}, function(err){
      if (err) throw err;
      cb (err)
  })
})


gulp.task('sync:gmagon.cn', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.cn/'))
  console.log('g_sync_dir=', g_sync_dir)

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:xxxx')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.co', function(cb){
  g_sync_dir = '../gmagon.co/';
  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:xxxx')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.org', function(cb){
  g_sync_dir = '../gmagon.org/';
  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:xxxx')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.net', function(cb){
  g_sync_dir = '../gmagon.net/';
  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:xxxx')(cb) }
  else{cb()}
})


gulp.task('default', gulpSequence('sync:gmagon.cn', 'sync:gmagon.co', 'sync:gmagon.net', 'sync:gmagon.org'))

/**
 * 按照文件来执行
 * gulp --gulpfile ./gulp-sync.js
 * 
 * 按照任务来执行
 * 
 * gulp --gulpfile ./gulp-sync.js --tasks
 * 
 * gulp --gulpfile ./gulp-sync.js sync:gmagon.cn
 */