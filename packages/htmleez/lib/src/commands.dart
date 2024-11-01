import 'package:htmleez/src/command.dart';

//ignore: camel_case_types
final class cmd {
  const cmd._();

  static Command _simple(String js) => SimpleCommand(js);
  static Command _complexx(String js) => ComplexCommand(js);

  static Command evalOnParent(String js) => _complexx("""
      if(!self.parentElement) { return; }
      let element = self.parentElement;
      $js
  """);

  static Command evalOnChildren(String selector, String js) => _complexx("""
      let children = self.querySelectorAll('$selector');
      children.forEach(function(element) {
        $js
      });
  """);

  static Command evalOnSiblings(String selector, String js) => _complexx("""
      if(!self.parentElement) { return; }
      let siblings = self.parentElement.querySelectorAll('$selector');
      siblings.forEach(function(element) {
        $js
      });
  """);

  static Command setInnerText(String text) => _simple("self.innerText = '$text'");

  static Command setInnerHtml(String html) => _simple("self.innerHTML = `$html`");

  static Command setOuterHtml(String html) => _simple("self.outerHTML = `$html`");

  static Command addAttribute(String name, String value) => _simple("self.setAttribute('$name', '$value')");

  static Command removeAttribute(String name) => _simple("self.removeAttribute('$name')");

  static Command setDisabled(bool disabled) => disabled ? addAttribute("disabled", "true") : removeAttribute("disabled");

  static Command addClass(String className) => _simple("self.classList.add('$className')");

  static Command removeClass(String className) => _simple("self.classList.remove('$className')");

  static Command toggleClass(String className) => _simple("self.classList.toggle('$className')");

  static Command toggleClassOnElement(String selector, String className) => _complexx("var el = document.querySelector('$selector');, if(el) { el.classList.toggle('$className'); }");

  static Command addClassOnParent(String className) => evalOnParent("element.classList.add('$className')");

  static Command removeClassOnParent(String className) => evalOnParent("element.classList.remove('$className')");

  static Command addClassOnChildren(String selector, String className) => evalOnChildren(selector, "element.classList.add('$className')");

  static Command removeClassOnChildren(String selector, String className) => evalOnChildren(selector, "element.classList.remove('$className')");

  static Command addClassOnSiblings(String selector, String className) => evalOnSiblings(selector, "element.classList.add('$className')");

  static Command removeClassOnSiblings(String selector, String className) => evalOnSiblings(selector, "element.classList.remove('$className')");

  static Command alert(String text) => _simple("alert('$text')");

  static Command remove() => _simple("self.remove()");

  static Command preventDefault() => _simple("event.preventDefault()");

  static Command consoleLog(String text) => _simple("console.log('$text')");

  static Command setValue(String value) => _simple("self.value = '$value'");
}

