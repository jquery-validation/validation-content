<script>{
	"title": "Reference docs"
}</script>

# Goals
The ultimate goal of this plugin is to make working with forms more fun for everyone. By improving the interaction, it is easier and less annoying for the user to fill out the form and submit it.

To achieve this, it is important that the plugin is actually deployed on websites around the world, so a lot of focus is spent on making it easy for developers - that's you - to use the plugin.

The plugin can never replace serverside validation and doesn't intend to do so. Having both in place gives you the necessary security for your application, as well as improved usability.

# Markup recommendations
Each input has a label associated with it: The for-attribute of the label refers to the id-attribute of the input.
<pre><code>
<label for="firstname">Firstname</label>
<input id="firstname" name="fname">
</code></pre>

The name attribute is '''required''' for input elements, the validation plugin doesn't work without it. Usually name and id attributes should have the same value.

# Methods
A validation method implements the logic to validate any element. Provided are a set of default validation methods, such as required. Apart from required itself and equalTo, all validation methods declare an element valid when it has no value at all. That way an email field is optional unless required is specified. You can specify an element input to contain a valid email address, or nothing at all. Use <a href="/jQuery.validator.addMethod/">jQuery.validator.addMethod</a> to implement custom methods.

# Rules
A validation rule applies one or more validation methods to an input element. You can specify validation rules via metadata or via plugin settings (option rules). The decision is often influenced by serverside infrastructure. If a web framework is used, it is often easier to use metadata, which is also good for fast prototyping. Plugin settings produce cleaner markup, though valid markup results from both.

## Fields with complex names (brackets, dots)
If your form consists of fields using names that aren't legal JavaScript identifiers, you have to quote those names when using the rules option:

<pre><code>
 $("#myform").validate({
   rules: {
     // no quoting necessary
     name: "required",
     // quoting necessary!
     "user[email]": "email",
     // dots need quoting, too!
     "user.address.street": "required"
   }
 });
</code></pre>

## Refactoring rules
Whenever you have multiple fields with the same rules and messages, refactoring those can reduce a lot of duplication. Using addMethod and addClassRules are most effective for that.

Let's consider an example where you have ten customer fields, each required and with a minlength of 2. You need custom messages for both rules. To avoid having to specify those rules and messages again and again, we can alias existing methods with different messages and group them into a single class:

<pre><code>
 // alias required to cRequired with new message
 $.validator.addMethod("cRequired", $.validator.methods.required,
   "Customer name required");
 // alias minlength, too
 $.validator.addMethod("cMinlength", $.validator.methods.minlength,
   // leverage parameter replacement for minlength, {0} gets replaced with 2
   $.format("Customer name must have at least {0} characters"));
 // combine them both, including the parameter for minlength
 $.validator.addClassRules("customer", { cRequired: true, cMinlength: 2 });
</code></pre>

With that in place, we can add a class customer to all customer fields and be done with it:

<pre><code>
 <input name="customer1" class="customer">
 <input name="customer2" class="customer">
 <input name="customer3" class="customer">
</code></pre>

# Error messages
An error message displays a hint for the user about invalid elements, and what is wrong. There are three ways to provide error messages. Via the title attribute of the input element to validate, via error labels and via plugin settings (option messages).

All validation rules included here provide a default error message which you can use for prototyping, because it is used when no specific message is provided.

The priorities are as follows: A custom message (passed by plugin options), the element's title, the default message.

# Error message display
Error messages are handled via label elements with an additional class (option errorClass). The link between the message and the invalid element is provided via the labels for attribute. When provided in the markup, they are shown and hidden accordingly, and otherwise created on demand. By default, labels are created after the invalid element, this is also customizable (option errorPlacement). It is also possible to put them into an error container (option errorLabelContainer). To use a different element then a label, specify the errorElement option.

# General messages
In addition to field-specific messages you can display a general "your form is invalid, please fix the highlighted fields!" message in a container anywhere on your page, eg. above the form (option errorContainer). The container is shown and hidden when errors occur and are fixed accordingly. The container for error labels (option errorLabelContainer) can also be nested inside the error container.

# Focusing of invalid elements
By default, the first invalid element in a form is focused after submitting a form with invalid elements. To prevent confusion on the behalf of the user, the plugin remembers the element that had focus when the form was submitted, and refocuses that element. That way the user can try to fill out elements of the form at the end, without being forced to focus them again and again. This can be disabled (option focusInvalid).

# Form submit
By default, the form submission is prevented when the form is invalid, and submitted as normal when it is valid. You can also handle the submission manually (option submitHandler).

## Skipping validation on submit
To skip validation while still using a submit-button, add a class="cancel" to that input.

<pre><code>
 <input type="submit" name="submit" value="Submit">
 <input type="submit" class="cancel" name="cancel" value="Cancel">
</code></pre>

[Demo for the cancel button](http://jqueryvalidation.org/files/demo/errorcontainer-demo.html)

# Validation event
By default, forms are validated on submit, triggered by the user clicking the submit button or pressing enter when a form input is focused (option onsubmit). In addition, once a field was highlighted as being invalid, it is validated whenever the user types something in the field (option onkeyup). When the user enters something invalid into a valid field, it is also validated when the field loses focus (option onblur).

The goal of these interactions is to provide feedback as early as possible, whilst avoiding user annoyance. Displaying error messages before the user had the chance to even type something is not helpful.

# Developing and debugging a form
While developing and debugging the form, you should set the debug option to true. That prevents form submission on both valid and invalid forms and outputs some helpful messages to window.console (available via Firebug or Firebug Lite) that help debugging. When you have everything set up and don't get any error messages displayed, check if your rules all accept empty elements as valid (like email or url methods).

Some issues are caused by certain form element's names. A name you should avoid is "submit" (for submit buttons and anything else). Browsers expose form elements as properties of the form element, by their name, in this case hiding native methods like submit(). Just don't use name="submit" and you're good.

# Validating multiple forms on one page
The plugin can handle only one form per call. In case you have multiple forms on a single page which you want to validate, you can avoid having to duplicate the plugin settings by modifying the defaults. Use <a href="/jQuery.validator.setDefaults/">jQuery.validator.setDefaults</a> to override multiple settings at once.