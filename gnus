(setq
 user-mail-address "kyle.a.schmidt@gmail.com"
 mml-secure-openpgp-signers '("24899B1E")
 gnus-select-method
 '(nnimap "gmail"
      (nnimap-address "imap.gmail.com")
      (nnimap-server-port 993)
      (nnimap-stream ssl))
 smtpmail-smtp-server "smtp.gmail.com"
 smtpmail-smtp-service 587
 message-send-mail-function 'smtpmail-send-it
 nntp-authinfo-file "~/.authinfo.gpg"
 gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]"
 gnus-agent nil
 gnus-message-archive-group nil
 mml-secure-openpgp-encrypt-to-self t)

(add-hook 'message-setup-hook 'mml-secure-message-sign)

(add-hook 'gnus-summary-mode-hook 'my-gnus-summary-keys)

(defun my-gnus-summary-keys ()
  (local-set-key "y" 'gmail-archive)
  (local-set-key "$" 'gmail-report-spam))

(defun gmail-archive ()
  (interactive)
  (gnus-summary-move-article nil "nnimap+imap.gmail.com:[Gmail]/All Mail"))

(defun gmail-report-spam ()
  "Report the current or marked mails as spam.
This moves them into the Spam folder."
  (interactive)
  (gnus-summary-move-article nil "nnimap+imap.gmail.com:[Gmail]/Spam"))
