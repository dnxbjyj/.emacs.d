> An Introduction to Programming in Emacs Lisp: https://www.gnu.org/software/emacs/manual/html_node/eintr/index.html
> 2018-09-25 周二，该看：1.2 Run a Program

# 运行elisp代码的几种方式：
### 运行单行代码
* 在代码的最后一个括号后面执行：`C-j`
* 在代码的中间执行：`C-M-x`
* 在代码的最后执行：`C-x C-e`

### 运行当前buffer中的所有代码
`init.el`:
```lisp
;; 运行当前buffer中的所有代码
(defun eval-this-buffer()
	(interactive)
	(eval-buffer nil (get-buffer-create "output"))
	(switch-to-buffer-other-window "output"))
```

# 注释
代码中以分号`;`开头的行都是注释行（但行注释）。

# 数据类型
### 单数据类型
* 字符串：只能用双引号`"`引起来。如果要在字符串中表示双引号，则需要加转义符`\`。此外，一个字符串可以跨多行。
* 字符：以`?`开头的单个字符，内部其实是用ASCII码和unicode码表示的，实际上是整型。
* 整数类型（29位精度）
* 二进制类型：以`#b`开头的二进制串，比如：`#b01001`
* 八进制类型：以`#o`开头的八进制串
* 十六进制类型：以`#x`开头的十六进制串
* 浮点类型（64位精度）
* 科学计数法：比如6.02e23, 5e-10
* 布尔型：`t`表示true，`nil`表示false，空字符串、0、`'false`、空vector都被当做`t`处理，而空list、`'()`则被当做`nil`处理。
### 集合数据类型
* vector：用方括号括起来的元素集合，元素之间用空格隔开（注意：不能用逗号隔开），不同元素可以是不同的类型，元素也可以是一个vector。例如：`[1 2 "haha" 1.22 [3 "bbb"]]`
* list：用圆括号括起来的元素集合，元素之间用空格隔开（注意：不能用逗号隔开），必须用引用，例如：`(quote (1 2 3))`，这等同于：`'(1 2 3)`，还等同于：`(list 1 (+ 1 1) 3)`，还等同于：``(1 ,(+ 1 1) 3)`

# 操作符
### 判断数值相等
```lisp
(= 2 (+ 1 1)) ;结果为t
(= 3 (+ 1 1)) ;结果为nil
(= 3.5 (+ 1 2.5)) ;结果为t
```
### 判断数值不相等
```lisp
(/= 2 3) ;结果为t
(/= 3 3) ;结果为nil
```
### 判断值相等
```lisp
(eq 'foo 2) ;结果为nil,eq操作符类似于java的==操作符
```
### 深度相等
```lisp
(equal '(1 2 (3 4)) (list 1 2 (list 3 (* 2 2)))) ;结果为t, equal操作符相当于java的Object.equals()
(equal "foo" "foo") ;结果为t
```
# 字符串常用函数
```lisp
(concat "aa" "bb" "ccc") ;拼接字符串，结果："aabbccc"
(string= "foo" "zz") ;判断两个字符串是否相等，结果：nil，也可用equal操作符
(substring "abcdef" 0 3) ;获取字符串的子串，结果："abc"
(upcase "abcd") ;把一个字符串全部转为大写字母，结果："ABCD"
(downcase "ABCd") ;把一个字符串全部转为小写字母，结果："abcd"
```
补充：查看字符串的其他可使用的函数：`M-x apropos <RET> string <RET>`

# 算数表达式
elisp所使用的算数表达式是前缀表达式，并且有一些特殊的函数来进行运算。


