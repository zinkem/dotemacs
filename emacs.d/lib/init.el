(defun startup_func(_)
  (load-file "/home/devuser/.emacs"))

(add-hook 'after-make-frame-functions #'startup_func)
