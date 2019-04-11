<?php

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class AddMediaMasterTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE media_master ROW_FORMAT = DYNAMIC");
        DB::statement("ALTER TABLE media_master CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci");
        // DB::statement("ALTER TABLE media_master MODIFY media_name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci");
        Schema::connection('pra_mysql')
            ->table('media_master', function (Blueprint $table) {

                $table->integer('media_type')->comment('媒体タイプ 1:新聞 2:雑誌 3:TV 4:Web')->change();
                $table->string('media_logo')->default('/assets/images/img_media.svg')->change();
                $table->string('master_id')->nullable()->default(null)->change();
                $table->string('media_id')->nullable()->default(null)->change();
                $table->string('company_name', 255)->nullable()->default(null)->change();
                $table->string('media_category', 5)->default(null)->change();
                $table->string('tel', 255)->nullable()->default(null)->change();
                $table->string('fax', 255)->nullable()->default(null)->change();
                $table->string('zip', 8)->nullable()->default(null)->change();
                $table->string('media_name', 255)->nullable()->default(null)->change();
                $table->string('company_name_kana', 255)->nullable()->default(null)->change();
                $table->string('media_explanation', 255)->comment('媒体説明・概要')->nullable()->default(null);
                $table->string('audience_layer', 255)->comment('視聴者層、読者層')->nullable()->default(null);

                //共通追加項目
                $table->string('company_logo', 2048)->comment('会社ロゴのパス')->default('/assets/images/img_media.svg');
                $table->string('diff_other_media', 255)->comment('他紙・他番組との違い')->nullable()->default(null);
                $table->string('media_organization', 255)->comment('制作体制・役割 or 編集体制・役割')->nullable()->default(null);
                $table->string('potential_customer', 255)->comment('読者層リード・見込み顧客')->nullable()->default(null);
                $table->json('production_company', 255)->comment('制作会社 or 編集プロダクション')->nullable()->default(null);
                $table->string('media_outline', 255)->comment('備考')->nullable()->default(null);
                $table->string('release_announce_email', 255)->comment('リリース配信アドレス')->nullable()->default(null);

                $table->string('competitive_media', 255)->comment('競合媒体')->nullable()->default(null);

                // 視聴率計算に必要
                $table->datetime('broadcast_start_time')->comment('番組開始時間')->nullable();
                $table->datetime('broadcast_end_time')->comment('番組終了時間')->nullable();

                // 詳細検索の地域用メタデータ(非表示)
                $table->string('publish_region', 255)->comment('放映・出版地域')->nullable()->default(null)->index();
            });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('media_master', function (Blueprint $table) {
            // TODO changeした属性を元に戻す
            // DB::statement("ALTER TABLE media_master CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci");
            Model::unguard();
            DB::statement('SET FOREIGN_KEY_CHECKS=0;');
            DB::table('media_master')->truncate();
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
            Model::reguard();
            $table->dropColumn('media_explanation');
            $table->dropColumn('audience_layer');
            $table->dropColumn('company_logo');
            $table->dropColumn('diff_other_media');
            $table->dropColumn('media_organization');
            $table->dropColumn('media_outline');
            $table->dropColumn('potential_customer');
            $table->dropColumn('production_company');
            $table->dropColumn('release_announce_email');
            $table->dropColumn('competitive_media');
            $table->dropColumn('broadcast_start_time');
            $table->dropColumn('broadcast_end_time');
            $table->dropColumn('publish_region');
        });
    }
}
