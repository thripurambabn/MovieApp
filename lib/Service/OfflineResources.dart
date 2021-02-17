import 'package:hive/hive.dart';
import 'package:movieapp/models/NowPlayingModel.dart';
import 'package:path_provider/path_provider.dart';

void hiveInitiators() {
  /* Hive Box Model Register */
  /* TypeId : 1 */
  
  Hive.registerAdapter(NowPlayingModelAdapter());
  /*TypeId : 2 */
  Hive.registerAdapter(DatesAdapter());
  /* TypeId : 3 */
  Hive.registerAdapter(ResultsAdapter());
}

class OfflineMoviesListDataTrack {
  static Box offlineMoviesListDataTrackBox;

  OfflineMoviesListDataTrack.initTrack() {
    hiveInit();
  }

  static Future<bool> hiveInit() async {
    return getApplicationDocumentsDirectory().then((dir) async {
      Hive.init(dir.path);
      
      offlineMoviesListDataTrackBox =
          await Hive.openBox<NowPlayingModel>("offlineMoviesListDataTrackBox");
      
      return true;
    });
  }

  static Future<bool> addorupdateofflineMoviesListTrack(
      {totalResults, results, id}) async {
    
    if (offlineMoviesListDataTrackBox == null) {
      await hiveInit();
    }
    int dataIndex = offlineMoviesListDataTrackBox.toMap().length;
    if (dataIndex > 0) {
      NowPlayingModel data = NowPlayingModel();
      data = await offlineMoviesListDataTrackBox
          .get(id);

      if (data != null) {
        if (data.results != null) {
          data.totalResults = totalResults;
          data.results = results;
          data.save();
        } else {
          await addNewMoviesListDet(id, totalResults, results);
        }
      } else {
        await addNewMoviesListDet(id, totalResults, results);
      }
    } else {
      await addNewMoviesListDet(id, totalResults, results);
    }
    return true;
  }

  static Future addNewMoviesListDet(id, totalResults, results) async {
    
    NowPlayingModel data = NowPlayingModel();
    data.totalResults = totalResults;
    data.results = results;
    await offlineMoviesListDataTrackBox.put(
        id, data);
  }

  static Future<NowPlayingModel> getMoviesListDetails({id}) async {
    if (offlineMoviesListDataTrackBox == null) {
      
      await hiveInit();
    }

    
    int dataIndex = offlineMoviesListDataTrackBox.toMap().length;
    
    NowPlayingModel data = NowPlayingModel();
    if (dataIndex > 0) {
      data = await offlineMoviesListDataTrackBox
          .get(id);
      
      if (data != null) {
        if (data.totalResults != null) {
          return data;
        } else {
          return data;
        }
      } else {
        return data;
      }
    } else {
      return data;
    }
  }
}
