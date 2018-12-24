'use strict'

module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
    es6: true,
  },
  parserOptions: {
    parser: 'babel-eslint',
    ecmaVersion: 2017,
    sourceType: 'module',
    ecmaFeatures: { jsx: true },
  },
  extends: [
    'plugin:vue/recommended',
    'plugin:prettier/recommended',
  ],
  plugins: [
    'vue',
    'prettier',
    'import'
  ],
  rules: {
    // 'dot-notation': 0, // ドット記法以外（ブランケット記法）を許可
    'prettier/prettier': 2,
    'import/newline-after-import': [ 2, { count: 1 }, ],
    'accessor-pairs': 2,
    'block-spacing': 2,
    'brace-style': 2,
    'comma-dangle': 2,
    'comma-spacing': 2,
    'comma-style': [2, 'last'], // カンマ位置は末尾に強制
    'constructor-super': 2,
    'curly': 0,
    'dot-location':2,
    'eol-last': 2,
    'eqeqeq': 2, // 厳密等価演算子を強制
    'handle-callback-err': 2,
    'indent': [ 'error', 2 ],
    'key-spacing': 2,
    'keyword-spacing': 2,
    'max-line-length': [ true, 100 ],
    'new-cap': 2,
    'new-parens': 2,
    'no-array-constructor': 2,
    'no-console': process.env.NODE_ENV === 'production' ? 2 : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 2 : 'off',
    'no-extra-semi': 2,
    'no-underscore-dangle': 'off',
    'no-unexpected-multiline': 2,
    'no-unreachable': 2,
    'no-unused-vars': 2,
    'no-var': 2, // const or let を強制
    'one-var': 0,
    'operator-linebreak':  2,
    'prefer-const': 2, // 再代入がない限り const を強制
    'quotes': [2, 'single'], // シングルクオートを強制
    'semi': [2, 'always'], // 末尾セミコロンを強制
    'semi-spacing':[ 2, { after: true, before: false }, ],
    'semi-style': [ 2, 'last' ],
    'space-before-function-paren': 0,
    'space-infix-ops': [2, {'int32Hint': false}],
    'strict': 0, // strict 強制を緩和
  }
}
