(setq ibuffer-saved-filter-groups
      '(("home"
        ("View" (or
                  (filename . ".html.erb")
                  (filename . ".html.haml")
                  (filename . ".twig")))
        ("Controllers" (or 
                  (filename . "Controller.php")
                  (filename . "_controller.rb")))
        ("Assets" (or 
                  (filename . ".js")
                  (filename . ".css")))
        ("Helpers" (filename . "_helper.rb"))
        ("Models" (filename . "/models/"))
        ("Repositories" (filename . "Repository.php"))
        ("emacs" (or
                  (name . "^\\*scratch\\*$")
                  (name . "^\\*Messages\\*$")))
        ("Org" (or (mode . org-mode)
                   (filename . ".org")))
       )))

(add-hook 'ibuffer-mode-hook
  '(lambda ()
     (setq ibuffer-show-empty-filter-groups nil)
     (ibuffer-switch-to-saved-filter-groups "home")))
