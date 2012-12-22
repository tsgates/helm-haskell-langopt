;;
;; generated @2012-12-22 01:22:23
;;
(defvar haskell-langopts '(
"OverlappingInstances          : Enable overlapping instances"
"IncoherentInstances           : Enable incoherent instances. Implies -XOverlappingInstances "
"UndecidableInstances          : Enable undecidable instances"
"Arrows                        : Enable arrow notation extension"
"DisambiguateRecordFields      : Enable record field disambiguation"
"ForeignFunctionInterface      : Enable foreign function interface (implied by -fglasgow-exts)"
"Generics                      : Deprecated, does nothing. No longer enables generic classes. See also GHC's support for generic programming."
"ImplicitParams                : Enable Implicit Parameters. Implied by -fglasgow-exts."
"NoImplicitPrelude             : Don't implicitly import Prelude"
"RebindableSyntax              : Employ rebindable syntax"
"NoMonomorphismRestriction     : Disable the monomorphism restriction"
"NoNPlusKPatterns              : Disable support for n+k patterns"
"NoTraditionalRecordSyntax     : Disable support for traditional record syntax (as supported by Haskell 98) C {f = x}"
"NoMonoPatBinds                : Make pattern bindings polymorphic"
"RelaxedPolyRec                : Relaxed checking for mutually-recursive polymorphic functions"
"ExtendedDefaultRules          : Use GHCi's extended default rules in a normal module"
"OverloadedStrings             : Enable overloaded string literals. "
"GADTs                         : Enable generalised algebraic data types. "
"GADTSyntax                    : Enable generalised algebraic data type syntax. "
"TypeFamilies                  : Enable type families."
"ConstraintKinds               : Enable a kind of constraints."
"DataKinds                     : Enable datatype promotion."
"PolyKinds                     : Enable kind polymorphism. Implies -XKindSignatures."
"ScopedTypeVariables           : Enable lexically-scoped type variables. Implied by -fglasgow-exts."
"MonoLocalBinds                : Enable do not generalise local bindings. "
"TemplateHaskell               : Enable Template Haskell. No longer implied by -fglasgow-exts."
"QuasiQuotes                   : Enable quasiquotation."
"BangPatterns                  : Enable bang patterns."
"CPP                           : Enable the C preprocessor."
"PatternGuards                 : Enable pattern guards."
"ViewPatterns                  : Enable view patterns."
"UnicodeSyntax                 : Enable unicode syntax."
"MagicHash                     : Allow # as a postfix modifier on identifiers."
"ExplicitForAll                : Enable explicit universal quantification. Implied by -XScopedTypeVariables, -XLiberalTypeSynonyms, -XRank2Types, -XRankNTypes, -XPolymorphicComponents, -XExistentialQuantification "
"PolymorphicComponents         : Enable polymorphic components for data constructors."
"Rank2Types                    : Enable rank-2 types."
"RankNTypes                    : Enable rank-N types."
"ImpredicativeTypes            : Enable impredicative types."
"ExistentialQuantification     : Enable existential quantification."
"KindSignatures                : Enable kind signatures."
"EmptyDataDecls                : Enable empty data declarations."
"ParallelListComp              : Enable parallel list comprehensions."
"TransformListComp             : Enable generalised list comprehensions."
"MonadComprehensions           : Enable monad comprehensions."
"UnliftedFFITypes              : Enable unlifted FFI types."
"InterruptibleFFI              : Enable interruptible FFI."
"LiberalTypeSynonyms           : Enable liberalised type synonyms."
"TypeOperators                 : Enable type operators."
"ExplicitNamespaces            : Enable using the keyword type to specify the namespace of entries in imports and exports."
"RecursiveDo                   : Enable recursive do (mdo) notation."
"ParallelArrays                : Enable parallel arrays."
"RecordWildCards               : Enable record wildcards."
"NamedFieldPuns                : Enable record puns."
"DisambiguateRecordFields      : Enable record field disambiguation. "
"UnboxedTuples                 : Enable unboxed tuples."
"StandaloneDeriving            : Enable standalone deriving."
"DeriveDataTypeable            : Enable deriving for the Data and Typeable classes."
"DeriveGeneric                 : Enable deriving for the Generic class."
"GeneralizedNewtypeDeriving    : Enable newtype deriving."
"TypeSynonymInstances          : Enable type synonyms in instance heads."
"FlexibleContexts              : Enable flexible contexts."
"FlexibleInstances             : Enable flexible instances. Implies -XTypeSynonymInstances "
"ConstrainedClassMethods       : Enable constrained class methods."
"DefaultSignatures             : Enable default signatures."
"MultiParamTypeClasses         : Enable multi parameter type classes."
"FunctionalDependencies        : Enable functional dependencies."
"PackageImports                : Enable package-qualified imports."
"LambdaCase                    : Enable lambda-case expressions."
"MultiWayIf                    : Enable multi-way if-expressions."
"Safe                          : Enable the Safe Haskell Safe mode."
"Trustworthy                   : Enable the Safe Haskell Trustworthy mode."
"Unsafe                        : Enable Safe Haskell Unsafe mode."
))

(defvar helm-c-source-haskell-langopt
  `((name . "Haskell Language Options")
    (candidates . haskell-langopts)
    (action . (("Insert Language Option" . insert-haskell-langopt)))))

;;
;; TODO.
;;   check duplicated declaration, and drop
;;
(defun insert-haskell-langopt (candid)
  (let ((opt (replace-regexp-in-string "[ ]*:[^:]+" "" candid)))
    (save-excursion
      (goto-char (point-min))
      (insert (concat "{-# LANGUAGE " opt " #-}\n")))))

;;;###autoload
(defun helm-haskell-langopt ()
  (interactive)
  (helm :sources '(helm-c-source-haskell-langopt)
        :buffer "*haskell-lang-opts*"
        :default (buffer-name helm-current-buffer)))
