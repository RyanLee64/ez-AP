; ModuleID = 'MicroC'
source_filename = "MicroC"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@fmt.2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.3 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %d = alloca i32, align 4
  %add_result = call i32 @add(i32 52, i32 10)
  store i32 %add_result, i32* %d, align 4
  %d1 = load i32, i32* %d, align 4
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %d1)
  ret i32 0
}

define i32 @add(i32 %a, i32 %b) {
entry:
  %a1 = alloca i32, align 4
  store i32 %a, i32* %a1, align 4
  %b2 = alloca i32, align 4
  store i32 %b, i32* %b2, align 4
  %c = alloca i32, align 4
  %a3 = load i32, i32* %a1, align 4
  %b4 = load i32, i32* %b2, align 4
  %tmp = add i32 %a3, %b4
  store i32 %tmp, i32* %c, align 4
  %c5 = load i32, i32* %c, align 4
  ret i32 %c5
}
