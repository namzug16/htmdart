import 'command.dart';

Command _simple(String js) => SimpleCommand(js);
Command _complexx(String js) => ComplexCommand(js);

Command evalOnParent(String js) => _complexx("""
      if(!self.parentElement) { return; }
      let element = self.parentElement;
      $js
  """);

Command evalOnChildren(String selector, String js) => _complexx("""
      let children = self.querySelectorAll('$selector');
      children.forEach(function(element) {
        $js
      });
  """);

Command evalOnSiblings(String selector, String js) => _complexx("""
      if(!self.parentElement) { return; }
      let siblings = self.parentElement.querySelectorAll('$selector');
      siblings.forEach(function(element) {
        $js
      });
  """);

Command setInnerText(String text) => _simple("self.innerText = '$text'");

Command setInnerHtml(String html) => _simple("self.innerHTML = `$html`");

Command setOuterHtml(String html) => _simple("self.outerHTML = `$html`");

Command addAttribute(String name, String value) => _simple("self.setAttribute('$name', '$value')");

Command removeAttribute(String name) => _simple("self.removeAttribute('$name')");

Command setDisabled(bool disabled) => disabled ? addAttribute("disabled", "true") : removeAttribute("disabled");

Command addClass(String className) => _simple("self.classList.add('$className')");

Command removeClass(String className) => _simple("self.classList.remove('$className')");

Command toggleClass(String className) => _simple("self.classList.toggle('$className')");

Command toggleClassOnElement(String selector, String className) => _complexx("var el = document.querySelector('$selector');, if(el) { el.classList.toggle('$className'); }");

Command addClassOnParent(String className) => evalOnParent("element.classList.add('$className')");

Command removeClassOnParent(String className) => evalOnParent("element.classList.remove('$className')");

Command addClassOnChildren(String selector, String className) => evalOnChildren(selector, "element.classList.add('$className')");

Command removeClassOnChildren(String selector, String className) => evalOnChildren(selector, "element.classList.remove('$className')");

Command addClassOnSiblings(String selector, String className) => evalOnSiblings(selector, "element.classList.add('$className')");

Command removeClassOnSiblings(String selector, String className) => evalOnSiblings(selector, "element.classList.remove('$className')");

Command alert(String text) => _simple("alert('$text')");

Command remove() => _simple("self.remove()");

Command preventDefault() => _simple("event.preventDefault()");

Command consoleLog(String text) => _simple("console.log('$text')");

Command setValue(String value) => _simple("self.value = '$value'");
