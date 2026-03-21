; Minimal handwritten IR to test f64 calling convention
target triple = "x86_64-apple-macosx14.0.0"

declare i64 @f64_parse(ptr)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"print_f64"(i64)
declare void @intrinsic_println(ptr)

@.str.3 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.4 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.msg = private unnamed_addr constant [11 x i8] c"result is:\00"

define i64 @simplex_main() {
entry:
  %a = call i64 @f64_parse(ptr @.str.3)
  %b = call i64 @f64_parse(ptr @.str.4)
  %c = call i64 @"sx_f64_add"(i64 %a, i64 %b)
  call void @intrinsic_println(ptr @.str.msg)
  %r = call i64 @"print_f64"(i64 %c)
  ret i64 0
}
