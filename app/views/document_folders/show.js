$("#folder-<%=@document_folder.id%>").empty().append('<%= escape_javascript(render @document_folder.document_folders)%>');
$("#folder-files").empty().append('<%= escape_javascript(render "/documents/form")%>');

