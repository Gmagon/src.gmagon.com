
'use strict';

var gulp = require('gulp');
var fileSync = require('gulp-file-sync');
var git = require('gulp-git');
var gulpSequence = require('gulp-sequence');

const sysFS = require('fs')
const sysPath = require('path')

const ignoreFils = ['CNAME','.git', '.idea', '.gitignore', '.npmignore', '.travis.yml', '.travis', 'node_modules']
var g_sync_dir = ""
var enable_sync_files = true

gulp.task('sync:git:pull', function(cb){
  git.pull('origin', ['master'], {cwd:g_sync_dir, quiet:false}, function(err){
      if (err) throw err;
      cb (err)
  })
})

gulp.task('sync:files', ['sync:git:pull'], function(cb){
   if (enable_sync_files) {
    fileSync('public', g_sync_dir, {
      ignore: ignoreFils
    })
   }else {
     cb()
   }
})

gulp.task('sync:git:add', ['sync:files'], function(){
  return  gulp.src(g_sync_dir)
    .pipe(git.add({cwd:g_sync_dir, quiet:false}))
})

gulp.task('sync:git:commit', ['sync:git:add'], function(){
  return  gulp.src(g_sync_dir)
    .pipe(git.commit('auto sync && update commit', {cwd:g_sync_dir, quiet:false}))
})

gulp.task('sync:git:push', ['sync:git:commit'], function(cb){
  git.push('origin', ['master'], {cwd:g_sync_dir, quiet:false}, function(err){
      if (err) throw err;
      cb (err)
  })
})

/////////////////////////////////////////////////////////////////////////////////////
gulp.task('sync:gmagon.com', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.com/'))
  console.log('g_sync_dir=', g_sync_dir)

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.cn', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.cn/'))
  console.log('g_sync_dir=', g_sync_dir)

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.co', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.co/'))
  console.log('g_sync_dir=', g_sync_dir)

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.org', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.org/'))
  console.log('g_sync_dir=', g_sync_dir)

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.net', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.net/'))
  console.log('g_sync_dir=', g_sync_dir)

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

//////////////////////////////////////////////////////////////////////////
gulp.task('sync:src.gmagon.com', function(cb){
  g_sync_dir = sysPath.normalize(__dirname)
  console.log('g_sync_dir=', g_sync_dir)
  enable_sync_files = false

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

gulp.task('default', gulpSequence('sync:gmagon.com', 'sync:gmagon.cn', 'sync:gmagon.co', 'sync:gmagon.net', 'sync:gmagon.org'))
gulp.task('publish', ['sync:src.gmagon.com'])

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