
'use strict';

var gulp = require('gulp');
var gutil = require('gulp-util');
var fileSync = require('gulp-file-sync');
var git = require('gulp-git');
var gulpSequence = require('gulp-sequence');
var exec = require('child_process').exec;
var yaml = require('js-yaml');

const sysFS = require('fs')
const sysPath = require('path')
const sysUtil = require('util')

const ignoreFils = ['CNAME','.git', '.idea', '.gitignore', '.npmignore', '.travis.yml', '.travis', 'node_modules']
var g_sync_dir = ""
var g_site_url = "https://gmagon.com"
var enable_sync_files = true
var enable_clean_or_revert = true


gulp.task('sync:git:reset', function(cb){
  if (enable_clean_or_revert) {
    git.reset('HEAD', {cwd:g_sync_dir, quiet:false, args:'--hard'}, function(err){
      if (err) throw err;
      cb ()
    })
  }else {
    cb()
  }
})

gulp.task('sync:git:clean', ['sync:git:reset'],  function(cb){
  if (enable_clean_or_revert) {
    git.clean({cwd:g_sync_dir, quiet:false, args:'-f'}, function(err){
      if (err) throw err;
      cb ()
    })
  }else {
    cb()
  }
})

gulp.task('sync:git:pull', ['sync:git:clean'],  function(cb){
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
    cb()
   }else {
     cb()
   }
})

gulp.task('sync:git:add', ['sync:files'], function(){
  return  gulp.src(g_sync_dir)
    .pipe(git.add({cwd:g_sync_dir, quiet:false, args:' -A '}))
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

gulp.task('modify:_config.yml', function(cb){
   var org_configYamlFile = sysPath.normalize(sysPath.join(__dirname, '/gmagon_config.yml'))
   var dest_configYamlFile = sysPath.normalize(sysPath.join(__dirname, '/_config.yml'))

   var doc = yaml.safeLoad(sysFS.readFileSync(org_configYamlFile, 'utf8'))
   doc.url = g_site_url
   gutil.log(sysUtil.inspect(doc, false, 10, true));

   //save file
   var format_doc = yaml.dump(doc,{
     lineWidth: 800
   })
   gutil.log(format_doc)

   sysFS.writeFileSync(dest_configYamlFile, format_doc, 'utf-8')
 })

/////////////////////////////////////////////////////////////////////////////////////
gulp.task('sync:gmagon.com', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.com/'))
  console.log('g_sync_dir=', g_sync_dir)
  enable_sync_files = true
  enable_clean_or_revert = true

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.cn', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.cn/'))
  console.log('g_sync_dir=', g_sync_dir)
  enable_sync_files = true
  enable_clean_or_revert = true

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.co', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.co/'))
  console.log('g_sync_dir=', g_sync_dir)
  enable_sync_files = true
  enable_clean_or_revert = true

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.org', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.org/'))
  console.log('g_sync_dir=', g_sync_dir)
  enable_sync_files = true
  enable_clean_or_revert = true

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

gulp.task('sync:gmagon.net', function(cb){
  g_sync_dir = sysPath.normalize(sysPath.join(__dirname, '../gmagon.net/'))
  
  console.log('g_sync_dir=', g_sync_dir)
  enable_sync_files = true
  enable_clean_or_revert = true

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})

/////////////////////////////////////////////////////////////////////////
// 修改_config.yaml
gulp.task('set:gmagon.com', function(cb){
  g_site_url = "https://gmagon.com"
  gulpSequence('modify:_config.yml')(cb)
})

gulp.task('set:gmagon.cn', function(cb){
  g_site_url = "https://gmagon.cn"
  gulpSequence('modify:_config.yml')(cb)
})

gulp.task('set:gmagon.co', function(cb){
  g_site_url = "https://gmagon.co"
  gulpSequence('modify:_config.yml')(cb)
})

gulp.task('set:gmagon.net', function(cb){
  g_site_url = "https://gmagon.net"
  gulpSequence('modify:_config.yml')(cb)
})

gulp.task('set:gmagon.org', function(cb){
  g_site_url = "https://gmagon.org"
  gulpSequence('modify:_config.yml')(cb)
})

//////////////////////////////////////////////////////////////////////////
gulp.task('sync:src.gmagon.com', function(cb){
  g_sync_dir = sysPath.normalize(__dirname)
  console.log('g_sync_dir=', g_sync_dir)
  enable_sync_files = false
  enable_clean_or_revert = false

  if (sysFS.existsSync(g_sync_dir)) { gulpSequence('sync:git:push')(cb) }
  else{cb()}
})


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