import sublime, sublime_plugin
import re
import textwrap

class PerlInsertPackageEventListener(sublime_plugin.EventListener):
    def on_query_completions(self, view, prefix, locations):
        if self.get_syntax(view) != "Perl":
            return []
        package = self.get_package_name(view)
        pkg_string = textwrap.dedent("""
            package %(package)s;
            use 5.016_001;
            use warnings;
        """ % locals())
        pkg10_string = textwrap.dedent("""
            package %(package)s;
            use 5.010_001;
            use strict;
            use warnings;
        """ % locals())
        return [("pkg", pkg_string), ("pkg10", pkg10_string)]
    def get_syntax(self, view):
        syntax_file = view.settings().get('syntax')
        filename = re.split('/', syntax_file)[-1]
        current_syntax = re.split('\.', filename)[0]
        return current_syntax
    def get_package_name(self, view):
        filename = view.file_name()
        package = re.sub(r'^.+/lib/([^\.]+)\.pm',r'\1',filename)
        package = package.replace('/','::')
        return package