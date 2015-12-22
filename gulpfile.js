var gulp = require('gulp');
var coffee = require('gulp-coffee');

gulp.task('build', function() {
  return gulp.src('app.coffee')
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest("./"))
});

gulp.task('default', function () {
  gulp.watch('app.coffee', ['build']);
});
