'use strict';

module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
    es6: true
  },
  parserOptions: {
    parser: 'babel-eslint',
    ecmaVersion: 2017,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true
    }
  },
  extends: ['eslint:recommended', 'plugin:vue/recommended', 'plugin:prettier/recommended'],
  plugins: ['vue', 'import', 'prettier'],
  rules: {
    // 'dot-notation': 'off',      // ドット記法以外（ブランケット記法）を許可
    // 'indent': ['error', 2], //フォーマットが壊れる要調査 コメントして無視する
    'vue/component-name-in-template-casing': 'off',
    'vue/html-closing-bracket-newline': 'off',
    'vue/max-attributes-per-line': [
      'error',
      {
        singleline: 4,
        multiline: {
          max: 4,
          allowFirstLine: true
        }
      }
    ],
    'prettier/prettier': 'off', //フォーマットが壊れる要調査 0にして無視する
    'import/newline-after-import': [
      'error',
      {
        count: 1
      }
    ],
    'accessor-pairs': 'error',
    'block-spacing': 'error',
    'brace-style': 'error',
    'comma-dangle': 'error',
    'comma-spacing': 'error',
    'comma-style': ['error', 'last'], // カンマ位置は末尾に強制
    'constructor-super': 'error',
    curly: 'off',
    'dot-location': 'error',
    'eol-last': 'error',
    eqeqeq: 'error', // 厳密等価演算子を強制
    'handle-callback-err': 'error',
    'key-spacing': 'error',
    'keyword-spacing': 'error',
    'max-line-length': [true, 100],
    'new-cap': 'error',
    'new-parens': 'error',
    'no-array-constructor': 'error',
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-extra-semi': 'error',
    'no-underscore-dangle': 'off',
    'no-unexpected-multiline': 'error',
    'no-unreachable': 'error',
    'no-unused-vars': 'error',
    'no-var': 'error', // const or let を強制
    'one-var': 'off',
    'operator-linebreak': 'error',
    'prefer-const': 'error', // 再代入がない限り const を強制
    quotes: ['error', 'single'], // シングルクオートを強制
    semi: ['error', 'always'], // 末尾セミコロンを強制
    'semi-spacing': [
      'error',
      {
        after: true,
        before: false
      }
    ],
    'semi-style': ['error', 'last'],
    'space-before-function-paren': 'off',
    'space-infix-ops': [
      'error',
      {
        int32Hint: false
      }
    ],
    strict: 'off' // strict 強制を緩和
  }
};
