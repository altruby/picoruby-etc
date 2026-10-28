#include <mruby.h>
#include <mruby/variable.h>
#include <mruby/array.h>
#include <mruby/string.h>
#include <mruby/error.h>
#include <mruby/numeric.h>
#include <pwd.h>
#include <errno.h>

static
mrb_value Etc(mrb_state *mrb)
{
  return mrb_const_get(mrb, mrb_obj_value(mrb->object_class), mrb_intern_cstr(mrb, "Etc"));
}

static
mrb_value Row(mrb_state *mrb)
{
  return mrb_const_get(mrb, Etc(mrb), mrb_intern_cstr(mrb, "Row"));
}

static
mrb_value etcrows(mrb_state *mrb, mrb_value self)
{
  struct passwd* row;
  mrb_value mrow, mrows;
  mrow  = Row(mrb);
  mrows = mrb_ary_new(mrb);
  errno = 0;
  setpwent();
  while((row = getpwent()) != NULL) {
    mrb_value r;
    r = mrb_funcall(
      mrb,
      mrow,
      "new",
      4,
      mrb_str_new_cstr(mrb, row->pw_name),
      mrb_str_new_cstr(mrb, row->pw_passwd),
      mrb_uint64_value(mrb, (uint64_t)row->pw_uid),
      mrb_uint64_value(mrb, (uint64_t)row->pw_gid)
    );
    mrb_ary_push(mrb, mrows, r);
  }
  if(errno != 0) mrb_sys_fail(mrb, "getpwent");
  endpwent();
  return mrows;
}

void
mrb_picoruby_etc_gem_init(mrb_state *mrb)
{
  struct RClass *etc, *row;
  etc = mrb_define_module(mrb, "Etc");
  row = mrb_define_class_under(mrb, etc, "Row", mrb->object_class);
  mrb_define_class_method(mrb, etc, "rows", etcrows, MRB_ARGS_NONE());
}

void
mrb_picoruby_etc_gem_final(mrb_state *mrb)
{
  (void)mrb;
}
