// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure()';
}


}

/// @nodoc
class $AuthFailureCopyWith<$Res>  {
$AuthFailureCopyWith(AuthFailure _, $Res Function(AuthFailure) __);
}


/// Adds pattern-matching-related methods to [AuthFailure].
extension AuthFailurePatterns on AuthFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InvalidEmail value)?  invalidEmail,TResult Function( _WrongPassword value)?  wrongPassword,TResult Function( _UserNotFound value)?  userNotFound,TResult Function( _UserDisabled value)?  userDisabled,TResult Function( _NetworkError value)?  networkError,TResult Function( _TooManyRequests value)?  tooManyRequests,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case _WrongPassword() when wrongPassword != null:
return wrongPassword(_that);case _UserNotFound() when userNotFound != null:
return userNotFound(_that);case _UserDisabled() when userDisabled != null:
return userDisabled(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _TooManyRequests() when tooManyRequests != null:
return tooManyRequests(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InvalidEmail value)  invalidEmail,required TResult Function( _WrongPassword value)  wrongPassword,required TResult Function( _UserNotFound value)  userNotFound,required TResult Function( _UserDisabled value)  userDisabled,required TResult Function( _NetworkError value)  networkError,required TResult Function( _TooManyRequests value)  tooManyRequests,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _InvalidEmail():
return invalidEmail(_that);case _WrongPassword():
return wrongPassword(_that);case _UserNotFound():
return userNotFound(_that);case _UserDisabled():
return userDisabled(_that);case _NetworkError():
return networkError(_that);case _TooManyRequests():
return tooManyRequests(_that);case _Unknown():
return unknown(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InvalidEmail value)?  invalidEmail,TResult? Function( _WrongPassword value)?  wrongPassword,TResult? Function( _UserNotFound value)?  userNotFound,TResult? Function( _UserDisabled value)?  userDisabled,TResult? Function( _NetworkError value)?  networkError,TResult? Function( _TooManyRequests value)?  tooManyRequests,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _InvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case _WrongPassword() when wrongPassword != null:
return wrongPassword(_that);case _UserNotFound() when userNotFound != null:
return userNotFound(_that);case _UserDisabled() when userDisabled != null:
return userDisabled(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _TooManyRequests() when tooManyRequests != null:
return tooManyRequests(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  invalidEmail,TResult Function()?  wrongPassword,TResult Function()?  userNotFound,TResult Function()?  userDisabled,TResult Function()?  networkError,TResult Function()?  tooManyRequests,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvalidEmail() when invalidEmail != null:
return invalidEmail();case _WrongPassword() when wrongPassword != null:
return wrongPassword();case _UserNotFound() when userNotFound != null:
return userNotFound();case _UserDisabled() when userDisabled != null:
return userDisabled();case _NetworkError() when networkError != null:
return networkError();case _TooManyRequests() when tooManyRequests != null:
return tooManyRequests();case _Unknown() when unknown != null:
return unknown();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  invalidEmail,required TResult Function()  wrongPassword,required TResult Function()  userNotFound,required TResult Function()  userDisabled,required TResult Function()  networkError,required TResult Function()  tooManyRequests,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case _InvalidEmail():
return invalidEmail();case _WrongPassword():
return wrongPassword();case _UserNotFound():
return userNotFound();case _UserDisabled():
return userDisabled();case _NetworkError():
return networkError();case _TooManyRequests():
return tooManyRequests();case _Unknown():
return unknown();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  invalidEmail,TResult? Function()?  wrongPassword,TResult? Function()?  userNotFound,TResult? Function()?  userDisabled,TResult? Function()?  networkError,TResult? Function()?  tooManyRequests,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case _InvalidEmail() when invalidEmail != null:
return invalidEmail();case _WrongPassword() when wrongPassword != null:
return wrongPassword();case _UserNotFound() when userNotFound != null:
return userNotFound();case _UserDisabled() when userDisabled != null:
return userDisabled();case _NetworkError() when networkError != null:
return networkError();case _TooManyRequests() when tooManyRequests != null:
return tooManyRequests();case _Unknown() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc


class _InvalidEmail implements AuthFailure {
  const _InvalidEmail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidEmail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.invalidEmail()';
}


}




/// @nodoc


class _WrongPassword implements AuthFailure {
  const _WrongPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WrongPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.wrongPassword()';
}


}




/// @nodoc


class _UserNotFound implements AuthFailure {
  const _UserNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.userNotFound()';
}


}




/// @nodoc


class _UserDisabled implements AuthFailure {
  const _UserDisabled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDisabled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.userDisabled()';
}


}




/// @nodoc


class _NetworkError implements AuthFailure {
  const _NetworkError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.networkError()';
}


}




/// @nodoc


class _TooManyRequests implements AuthFailure {
  const _TooManyRequests();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TooManyRequests);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.tooManyRequests()';
}


}




/// @nodoc


class _Unknown implements AuthFailure {
  const _Unknown();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.unknown()';
}


}




// dart format on
