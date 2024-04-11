import { GridDataElement } from '../model/CommonData';

export class CommonViewModel {
  getGridData(): GridDataElement[] {
    let gridData: GridDataElement[] = [
      new GridDataElement(`哈哈哈`, $r('app.media.ic_eshop')),
      new GridDataElement(`haha`, $r('app.media.ic_eshop')),
      new GridDataElement("88888888888888888", $r('app.media.ic_eshop')),
      new GridDataElement(`搜索1`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索2`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索3`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索4`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索5`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索6`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索7`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索11`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索12`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索13`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索14`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索15`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索16`, $r('app.media.ic_eshop')),
      new GridDataElement(`搜索17`, $r('app.media.ic_eshop')),
      new GridDataElement($r(null), $r('app.media.ic_eshop')),

    ]
    return gridData
  }
}

export default new CommonViewModel()



