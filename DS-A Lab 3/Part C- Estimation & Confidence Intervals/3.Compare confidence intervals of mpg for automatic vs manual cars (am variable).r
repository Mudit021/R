data(mtcars)
mpg_automatic <- mtcars$mpg[mtcars$am == 0]
mpg_manual <- mtcars$mpg[mtcars$am == 1]
t.test(mpg_automatic)
t.test(mpg_manual)