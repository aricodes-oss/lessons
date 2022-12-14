(defun org-html-src-block (src-block contents info)
  "Transcode a SRC-BLOCK element from Org to HTML.
CONTENTS holds the contents of the item.  INFO is a plist holding
contextual information."
  (if (org-export-read-attribute :attr_html src-block :textarea)
      (org-html--textarea-block src-block)
    (let ((lang (org-element-property :language src-block))
      (caption (org-export-get-caption src-block))
      (code (org-html-format-code src-block info))
      (label (let ((lbl (and (org-element-property :name src-block)
                 (org-export-get-reference src-block info))))
           (if lbl (format " id=\"%s\"" lbl) ""))))
      (if (not lang) (format "<pre><code>\n%s</code></pre>" label code)
    (format
     "<div class=\"org-src-container\">\n%s%s\n</div>"
     (if (not caption) ""
       (format "<label class=\"org-src-name\">%s</label>"
           (org-export-data caption info)))
      (format "\n<pre><code class=\"language-%s\">%s</code></pre>" lang code))))))

(setq org-html-preamble "<script src=\"https://assets.aricodes.net/prism/prism.js\"></script>")
