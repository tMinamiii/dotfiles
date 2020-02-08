module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
    es6: true
  },
  parser: '@typescript-eslint/parser',
  parserOptions: {
    jsx: true,
    useJSXTextNode: true
  },
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:prettier/recommended',
    'prettier',
    'prettier/@typescript-eslint',
  ],
  plugins: [
    'prettier',
    'import'
  ],
  rules: {
    // typescript
    '@typescript-eslint/adjacent-overload-signatures': 'off',

    // import
    'import/order': 'error',
    'import/newline-after-import': [ 'error', {
        count: 1
      }
    ],

    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'require-jsdoc': 'off',
    'require-await': 'off',
    'valid-jsdoc': 'off',
    'sort-imports': 'off',
    'prefer-const': 'error', // 再代入がない限り const を強制
    strict: 'off', // strict 強制を緩和
    'max-len': [ 'error', {
        code: 120,
        tabWidth: 2,
        ignoreTrailingComments: true,
        ignoreUrls: true,
        ignoreStrings: true,
        ignoreTemplateLiterals: true,
        ignoreRegExpLiterals: true
      }
    ],

    // prettierの設定↓
    'prettier/prettier': [
      'error',
      {
        printWidth: 120,
        tabWidth: 2,
        semi: true,
        singleQuote: true,
        trailingComma: 'es5',
        bracketSpacing: true,
        useTabs: false
      }
    ],
  }
}
