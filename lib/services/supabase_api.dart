import 'package:supabase/supabase.dart';

const String supabaseUrl = 'https://vgpqtzukwbclunddkhzv.supabase.co';

const String supabaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0MDQ0MjEwOCwiZXhwIjoxOTU2MDE4MTA4fQ.mOe0jg2QMzppLrOVT7WRyMiNE1CJhiuot_GB5nQZ6Ts";

class SupaBaseManager {
  final client = SupabaseClient(supabaseUrl, supabaseKey);

  Future getData() async {
    final selectResponse = await client
        .from('news')
        .select()
        .order('id', ascending: false)
        .execute();
    if (selectResponse.error == null) {
      //print('response.data: ${selectResponse.data}');
    }
    print(selectResponse.toJson());
    return selectResponse.toJson();
  }

  Future getStockNews() async {
    final selectResponse =
        await client.from('news').select().like('tag', '%crypto%').execute();
    if (selectResponse.error == null) {
      print('response.data: ${selectResponse.data}');
    }
    print(selectResponse.toJson());
    return selectResponse.toJson();
  }
}
