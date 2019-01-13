'use strict';

module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
    es6: true
  },
  parser: 'vue-eslint-parser',
  parserOptions: {
    // parser: 'babel-eslint',
    parser: 'typescript-eslint-parser',
    ecmaVersion: 2017,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true
    }
  },
  extends: [
    'eslint:recommended',
    'plugin:vue/recommended',
    'plugin:prettier/recommended',
    'standard',
    'typescript'
  ],
  plugins: ['vue', 'import', 'prettier'],
  rules: {
    'prettier/prettier': 'off', // フォーマットが壊れる要調査 0にして無視する
    'typescript/no-var-requires': 'off',
    'require-jsdoc': 'off',

    'vue/component-name-in-template-casing': 'off',
    'vue/html-closing-bracket-newline': 'off',
    'vue/max-attributes-per-line': ['error', {
      singleline: 3,
      multiline: {
        max: 1,
        allowFirstLine: false
      }
    }],

    'import/newline-after-import': ['error', {
      count: 1
    }],

    'max-len': ['error', {
      code: 120,
      tabWidth: 2,
      ignoreTrailingComments: true,
      ignoreUrls: true,
      ignoreStrings: true,
      ignoreTemplateLiterals: true,
      ignoreRegExpLiterals: true
    }],
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-spaced-func': 'error',
    'prefer-const': 'error', // 再代入がない限り const を強制
    'semi-spacing': ['error', {
      after: true,
      before: false
    }],
    'semi-style': ['error', 'last'],
    'space-before-function-paren': ['error', 'never'],
    semi: ['error', 'always'], // 末尾セミコロンを強制
    strict: 'off' // strict 強制を緩和
  }
};
