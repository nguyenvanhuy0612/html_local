import setup
import crawl_process
import crawl_process_with_details

url_list = 'https://vietlott.vn/en/trung-thuong/ket-qua-trung-thuong/so-ket-qua?gameid=3&nocatche=1'
url_details = 'https://vietlott.vn/vi/trung-thuong/ket-qua-trung-thuong/645?id=00003&nocatche=1'
# setup.driver_get_url(url=url_list)
setup.driver_get_url(url=url_details)


# mega 86 pages
# crawl_process.pagination(start_page=0, stop_page=86, is_remove=True, file=r'../DATABASE/CSV/mega.csv', product='mega')

# power 66 pages
# crawl_process.pagination(start_page=0, stop_page=66, is_remove=True, file=r'../DATABASE/CSV/power.csv', product='Power')

#00683 ngày 27/12/2020
crawl_process_with_details.pagination_mega(stop_page=683, file='../DATABASE/CSV/mega_details.csv')